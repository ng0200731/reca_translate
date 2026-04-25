"""
Translation Engine

Orchestrates: glossary term extraction -> LLM call -> glossary post-processing
"""
from tools.glossary_manager import find_terms_in_text, get_all_translations
from tools.llm_client import (
    get_backend, list_backends, LANGUAGE_NAMES, SYSTEM_PROMPT,
    get_selected_openrouter_models, get_api_key, get_base_url,
)


def build_glossary_context(language: str) -> str:
    translations = get_all_translations(language)
    if not translations:
        return "(No glossary terms available for this language)"
    lines = []
    for en, trans in sorted(translations.items()):
        lines.append(f"  {en} → {trans}")
    return "\n".join(lines)


def post_process(text: str, language: str, original: str) -> str:
    translations = get_all_translations(language)
    if not translations:
        return text
    matches = find_terms_in_text(original)
    for term_en, normalized, start, end in matches:
        expected = translations.get(normalized)
        if expected and expected not in text:
            pass
    return text


def _translate_single(backend, text, lang, matches, glossary_terms):
    glossary = build_glossary_context(lang)
    try:
        translation, model_used = backend.translate(text, lang, glossary)
        translation = post_process(translation, lang, text)
        lang_translations = get_all_translations(lang)
        warnings = []
        for term_en, normalized, _, _ in matches:
            expected = lang_translations.get(normalized)
            if expected and expected not in translation:
                warnings.append(f"Glossary term '{term_en}' may not use verified translation '{expected}'")
        return {
            "translation": translation,
            "glossary_terms": glossary_terms,
            "warnings": warnings,
            "model_used": model_used,
        }
    except Exception as e:
        return {
            "translation": "",
            "glossary_terms": glossary_terms,
            "warnings": [f"Translation error: {str(e)}"],
            "model_used": "",
        }


def translate_text(text: str, languages: list[str], backend_name: str = "openai") -> dict[str, dict]:
    """Translate text with a single backend. Returns {lang: result}."""
    if not text.strip():
        return {}
    matches = find_terms_in_text(text)
    glossary_terms = list(set(m[0] for m in matches))
    backend = get_backend(backend_name)
    results = {}
    for lang in languages:
        results[lang] = _translate_single(backend, text, lang, matches, glossary_terms)
    return results


def translate_text_multi(text: str, languages: list[str], backend_name: str = "openrouter") -> list[dict]:
    """Translate text, expanding multi-model backends into separate result rows."""
    if not text.strip():
        return []

    matches = find_terms_in_text(text)
    glossary_terms = list(set(m[0] for m in matches))

    if backend_name == "openrouter":
        return _translate_openrouter_multi(text, languages, matches, glossary_terms)

    backend = get_backend(backend_name)
    rows = []
    for lang in languages:
        result = _translate_single(backend, text, lang, matches, glossary_terms)
        rows.append({
            "lang": lang, "backend": backend_name,
            "translation": result["translation"],
            "model_used": result.get("model_used", backend_name),
            "warnings": result.get("warnings", []),
        })
    return rows


def _translate_openrouter_multi(text, languages, matches, glossary_terms):
    """Run each selected OpenRouter model separately."""
    import openai

    selected_models = get_selected_openrouter_models()
    api_key = get_api_key("openrouter")
    base_url = get_base_url("openrouter")

    if not api_key or not selected_models:
        return []

    client = openai.OpenAI(api_key=api_key, base_url=base_url)
    rows = []

    for model in selected_models:
        for lang in languages:
            lang_name = LANGUAGE_NAMES.get(lang, lang)
            glossary = build_glossary_context(lang)
            system = SYSTEM_PROMPT.format(target_language=lang_name, glossary=glossary)
            try:
                resp = client.chat.completions.create(
                    model=model,
                    messages=[
                        {"role": "system", "content": system},
                        {"role": "user", "content": text}
                    ],
                    temperature=0.1,
                )
                translation = resp.choices[0].message.content.strip()
                translation = post_process(translation, lang, text)
                lang_translations = get_all_translations(lang)
                warnings = []
                for term_en, normalized, _, _ in matches:
                    expected = lang_translations.get(normalized)
                    if expected and expected not in translation:
                        warnings.append(f"Glossary term '{term_en}' may not use verified translation '{expected}'")
                rows.append({
                    "lang": lang, "backend": "openrouter",
                    "translation": translation, "model_used": model, "warnings": warnings,
                })
            except Exception as e:
                rows.append({
                    "lang": lang, "backend": "openrouter",
                    "translation": "", "model_used": model,
                    "warnings": [f"Translation error: {str(e)}"],
                })

    return rows


def translate_with_model(text, languages, backend_name, model=""):
    """Translate with a specific backend and model. Returns list of result rows."""
    import openai

    if not text.strip():
        return []

    matches = find_terms_in_text(text)
    rows = []

    if backend_name == "openrouter":
        api_key = get_api_key("openrouter")
        base_url = get_base_url("openrouter")
        if not api_key:
            return []
        # If no specific model, use all selected
        models_to_use = [model] if model else get_selected_openrouter_models()
        client = openai.OpenAI(api_key=api_key, base_url=base_url)
        for m in models_to_use:
            for lang in languages:
                glossary = build_glossary_context(lang)
                lang_name = LANGUAGE_NAMES.get(lang, lang)
                system = SYSTEM_PROMPT.format(target_language=lang_name, glossary=glossary)
                try:
                    resp = client.chat.completions.create(
                        model=m, messages=[
                            {"role": "system", "content": system},
                            {"role": "user", "content": text}
                        ], temperature=0.1,
                    )
                    translation = resp.choices[0].message.content.strip()
                    translation = post_process(translation, lang, text)
                    rows.append({"lang": lang, "backend": "openrouter", "translation": translation, "model_used": m, "warnings": []})
                except Exception as e:
                    rows.append({"lang": lang, "backend": "openrouter", "translation": "", "model_used": m, "warnings": [str(e)]})
        return rows

    if backend_name == "gemini":
        api_key = get_api_key("gemini")
        if not api_key:
            return []
        model = model or "gemini-2.5-flash"
        client = openai.OpenAI(api_key=api_key, base_url="https://generativelanguage.googleapis.com/v1beta/openai/")
        for lang in languages:
            glossary = build_glossary_context(lang)
            lang_name = LANGUAGE_NAMES.get(lang, lang)
            system = SYSTEM_PROMPT.format(target_language=lang_name, glossary=glossary)
            try:
                resp = client.chat.completions.create(
                    model=model, messages=[
                        {"role": "system", "content": system},
                        {"role": "user", "content": text}
                    ], temperature=0.1,
                )
                translation = resp.choices[0].message.content.strip()
                translation = post_process(translation, lang, text)
                rows.append({"lang": lang, "backend": "gemini", "translation": translation, "model_used": model, "warnings": []})
            except Exception as e:
                rows.append({"lang": lang, "backend": "gemini", "translation": "", "model_used": model, "warnings": [str(e)]})
        return rows

    # Other backends (openai, anthropic, deepl)
    backend = get_backend(backend_name)
    glossary_terms = list(set(m[0] for m in matches))
    for lang in languages:
        result = _translate_single(backend, text, lang, matches, glossary_terms)
        rows.append({
            "lang": lang, "backend": backend_name,
            "translation": result["translation"],
            "model_used": result.get("model_used", backend_name),
            "warnings": result.get("warnings", []),
        })
    return rows


def get_available_backends():
    return list_backends()
