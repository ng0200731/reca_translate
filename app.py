"""Flask app for Garment Fabric & Care Instruction Translation."""
import json
import os
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

from flask import Flask, jsonify, render_template, request

# Add project root to path for imports
ROOT = Path(__file__).parent
sys.path.insert(0, str(ROOT))

from tools.glossary_manager import (
    LANGUAGES, CATEGORIES, get_db, search_term as gm_search,
    list_terms as gm_list, add_term as gm_add, verify_term as gm_verify,
    delete_term as gm_delete, export_csv as gm_export, import_csv as gm_import
)
from tools.translator import translate_text, translate_text_multi, translate_with_model, get_available_backends
from tools.llm_client import (
    load_settings, save_settings, get_provider_info,
    OPENROUTER_FREE_MODELS, BACKENDS, get_selected_openrouter_models
)

PROVIDER_LABELS = {
    "openai": "OpenAI (GPT)",
    "anthropic": "Anthropic (Claude)",
    "deepl": "DeepL",
    "openrouter": "OpenRouter (Free Models)",
    "gemini": "Google Gemini",
    "libretranslate": "LibreTranslate (Self-Hosted)",
}

app = Flask(__name__)


# --- Main SPA Page ---

@app.route("/")
def index():
    backends = get_available_backends()
    providers = get_provider_info()

    # Build flat model list from all connected backends
    all_models = []
    if "openrouter" in backends:
        selected = get_selected_openrouter_models()
        for m in selected:
            short = m.split("/")[-1].replace(":free", "")
            all_models.append({"backend": "openrouter", "model": m, "short_name": short})
    if "gemini" in backends:
        model = providers.get("gemini", {}).get("model", "gemini-2.5-flash")
        all_models.append({"backend": "gemini", "model": model, "short_name": model})
    if "openai" in backends:
        model = providers.get("openai", {}).get("model", "gpt-4o")
        all_models.append({"backend": "openai", "model": model, "short_name": model})
    if "anthropic" in backends:
        model = providers.get("anthropic", {}).get("model", "claude-sonnet-4-20250514")
        all_models.append({"backend": "anthropic", "model": model, "short_name": model})
    if "libretranslate" in backends:
        all_models.append({"backend": "libretranslate", "model": "libretranslate", "short_name": "LibreTranslate"})

    return render_template(
        "index.html",
        languages=LANGUAGES,
        categories=CATEGORIES,
        backends=backends,
        providers=providers,
        provider_labels=PROVIDER_LABELS,
        openrouter_models=OPENROUTER_FREE_MODELS,
        all_backends=list(BACKENDS.keys()),
        all_models=all_models,
    )


@app.route("/translate", methods=["POST"])
def translate():
    data = request.get_json()

    # Honeypot check
    if data.get("website"):
        return jsonify({"error": "Invalid submission"}), 400

    text = data.get("text", "").strip()
    languages = data.get("languages", [])
    models = data.get("models", [])

    # Legacy: single backend or backends list
    if not models:
        backends = data.get("backends", [])
        single = data.get("backend")
        if single:
            backends = [single]
        for b in backends:
            if b == "openrouter":
                models.append({"backend": "openrouter", "model": ""})
            else:
                models.append({"backend": b, "model": ""})

    if not text:
        return jsonify({"error": "No text provided"}), 400
    if not languages:
        return jsonify({"error": "No languages selected"}), 400
    if not models:
        return jsonify({"error": "No models selected"}), 400

    from tools.translator import translate_with_model
    rows = []
    with ThreadPoolExecutor(max_workers=len(models)) as pool:
        futs = {pool.submit(translate_with_model, text, languages, m["backend"], m.get("model", "")): i for i, m in enumerate(models)}
        try:
            for fut in as_completed(futs, timeout=180):
                try:
                    rows.extend(fut.result())
                except Exception as e:
                    rows.append({"lang": "", "backend": "", "translation": "", "model_used": "", "warnings": [f"Backend error: {e}"]})
        except TimeoutError:
            for fut in futs:
                if fut.done() and not fut.cancelled():
                    try:
                        rows.extend(fut.result())
                    except Exception:
                        pass
            if not rows:
                return jsonify({"error": "Translation timed out. Try fewer models or languages."}), 504
    return jsonify({"results": rows})


@app.route("/api/terms", methods=["GET"])
def api_list_terms():
    category = request.args.get("category")
    search = request.args.get("search")

    conn = get_db()
    cursor = conn.cursor()

    if search:
        rows = cursor.execute(
            """SELECT t.id, t.term_en, t.category, t.notes,
                GROUP_CONCAT(tr.language || ':' || tr.translation, '|') AS translations
            FROM terms t
            LEFT JOIN translations tr ON t.id = tr.term_id
            WHERE t.normalized_en LIKE ?
            GROUP BY t.id
            ORDER BY t.category, t.term_en""",
            (f"%{search.lower()}%",)
        ).fetchall()
    elif category:
        rows = cursor.execute(
            """SELECT t.id, t.term_en, t.category, t.notes,
                GROUP_CONCAT(tr.language || ':' || tr.translation, '|') AS translations
            FROM terms t
            LEFT JOIN translations tr ON t.id = tr.term_id
            WHERE t.category = ?
            GROUP BY t.id
            ORDER BY t.term_en""",
            (category,)
        ).fetchall()
    else:
        rows = cursor.execute(
            """SELECT t.id, t.term_en, t.category, t.notes,
                GROUP_CONCAT(tr.language || ':' || tr.translation, '|') AS translations
            FROM terms t
            LEFT JOIN translations tr ON t.id = tr.term_id
            GROUP BY t.id
            ORDER BY t.category, t.term_en
        """).fetchall()

    terms = []
    for row in rows:
        trans_dict = {}
        if row["translations"]:
            for pair in row["translations"].split("|"):
                if ":" in pair:
                    lang, trans = pair.split(":", 1)
                    trans_dict[lang] = trans

        terms.append({
            "id": row["id"],
            "term_en": row["term_en"],
            "category": row["category"],
            "notes": row["notes"] or "",
            "translations": trans_dict,
        })

    conn.close()
    return jsonify({"terms": terms})


@app.route("/api/terms", methods=["POST"])
def api_add_term():
    data = request.get_json()

    if data.get("website"):
        return jsonify({"error": "Invalid submission"}), 400

    term_en = data.get("term_en", "").strip()
    category = data.get("category", "").strip()
    translations = data.get("translations", {})
    notes = data.get("notes", "").strip()

    if not term_en or not category:
        return jsonify({"error": "Term and category required"}), 400

    if category not in CATEGORIES:
        return jsonify({"error": f"Invalid category. Must be one of: {CATEGORIES}"}), 400

    success = gm_add(term_en, category, translations, notes or None)
    if success:
        return jsonify({"ok": True})
    else:
        return jsonify({"error": "Term already exists"}), 409


@app.route("/api/terms/<int:term_id>/verify", methods=["POST"])
def api_verify_term(term_id):
    data = request.get_json()
    language = data.get("language")
    gm_verify(term_id, language)
    return jsonify({"ok": True})


@app.route("/api/terms/<int:term_id>", methods=["DELETE"])
def api_delete_term(term_id):
    gm_delete(term_id)
    return jsonify({"ok": True})


@app.route("/api/terms/<int:term_id>/translations", methods=["PUT"])
def api_update_translation(term_id):
    data = request.get_json()
    language = data.get("language")
    translation = data.get("translation", "").strip()

    if not language or not translation:
        return jsonify({"error": "Language and translation required"}), 400

    conn = get_db()
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE translations SET translation = ? WHERE term_id = ? AND language = ?",
        (translation, term_id, language)
    )
    conn.commit()
    conn.close()
    return jsonify({"ok": True})


@app.route("/api/glossary/export", methods=["GET"])
def api_export():
    lang = request.args.get("lang")
    output = ROOT / ".tmp" / f"glossary_export_{lang or 'all'}.csv"
    gm_export(lang, str(output))
    return jsonify({"file": str(output)})


@app.route("/api/backends", methods=["GET"])
def api_backends():
    return jsonify({"backends": get_available_backends()})


# --- Settings Page ---

@app.route("/api/settings", methods=["POST"])
def api_save_settings():
    data = request.get_json()

    if data.get("website"):
        return jsonify({"error": "Invalid submission"}), 400

    providers = data.get("providers", {})
    current = load_settings()
    current["providers"] = providers
    save_settings(current)

    return jsonify({
        "ok": True,
        "available_backends": get_available_backends(),
    })


if __name__ == "__main__":
    app.run(debug=True, port=5000)
