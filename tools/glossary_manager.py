"""
Glossary Manager Tool

Operations: init, seed, search, add, list, export, import, verify
Usage: py tools/glossary_manager.py <operation> [args]

Database stored in .tmp/glossary.db
"""
import argparse
import csv
import io
import os
import re
import sqlite3
import sys
from datetime import datetime
from pathlib import Path

# Fix Windows console encoding for CJK/Unicode output
if sys.platform == "win32":
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
    sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding="utf-8", errors="replace")

DB_PATH = Path(__file__).parent.parent / ".tmp" / "glossary.db"
SQL_PATH = Path(__file__).parent.parent / "sql"
LANGUAGES = ["es", "fr", "de", "ko", "zh-CN", "ja"]
CATEGORIES = ["fabric", "care_instruction", "garment_part", "treatment", "temperature", "general"]

def get_db():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

def init_db():
    """Create database from schema and seed with core terms."""
    DB_PATH.parent.mkdir(parents=True, exist_ok=True)

    conn = get_db()
    cursor = conn.cursor()

    # Read and execute schema
    schema_file = SQL_PATH / "glossary_schema.sql"
    if schema_file.exists():
        with open(schema_file, "r", encoding="utf-8") as f:
            cursor.executescript(f.read())
        print(f"[OK] Schema created from {schema_file}")
    else:
        print(f"[ERROR] Schema file not found: {schema_file}")
        conn.close()
        return False

    # Read and execute seed data
    seed_file = SQL_PATH / "seed_core_terms.sql"
    if seed_file.exists():
        with open(seed_file, "r", encoding="utf-8") as f:
            cursor.executescript(f.read())
        print(f"[OK] Seed data loaded from {seed_file}")
    else:
        print(f"[WARN] Seed file not found: {seed_file}")

    conn.commit()
    conn.close()

    # Verify
    conn = get_db()
    cursor = conn.cursor()
    term_count = cursor.execute("SELECT COUNT(*) FROM terms").fetchone()[0]
    trans_count = cursor.execute("SELECT COUNT(*) FROM translations").fetchone()[0]
    print(f"[OK] Database initialized: {term_count} terms, {trans_count} translations")
    conn.close()
    return True

def search_term(query):
    """Search for a term by English text."""
    conn = get_db()
    cursor = conn.cursor()

    normalized = query.lower().strip()
    rows = cursor.execute(
        "SELECT id, term_en, category, notes FROM terms WHERE normalized_en LIKE ?",
        (f"%{normalized}%",)
    ).fetchall()

    if not rows:
        print(f"[INFO] No terms found for '{query}'")
        conn.close()
        return

    for row in rows:
        print(f"\n[{row['id']}] {row['term_en']} ({row['category']})")
        if row["notes"]:
            print(f"    Notes: {row['notes']}")

        trans = cursor.execute(
            "SELECT language, translation, verified, source FROM translations WHERE term_id = ?",
            (row["id"],)
        ).fetchall()

        for t in trans:
            verified_mark = "✓" if t["verified"] else "?"
            print(f"    {t['language']}: {t['translation']} [{verified_mark}] ({t['source'] or 'unknown'})")

    conn.close()

def list_terms(category=None):
    """List all terms, optionally filtered by category."""
    conn = get_db()
    cursor = conn.cursor()

    if category:
        rows = cursor.execute(
            "SELECT id, term_en, category FROM terms WHERE category = ? ORDER BY term_en",
            (category,)
        ).fetchall()
    else:
        rows = cursor.execute(
            "SELECT id, term_en, category FROM terms ORDER BY category, term_en"
        ).fetchall()

    print(f"\n{len(rows)} terms:")
    for row in rows:
        print(f"  [{row['id']}] {row['term_en']} ({row['category']})")

    conn.close()

def add_term(term_en, category, translations=None, notes=None):
    """Add a new term with translations."""
    conn = get_db()
    cursor = conn.cursor()

    normalized = term_en.lower().strip()

    # Check if exists
    existing = cursor.execute(
        "SELECT id FROM terms WHERE normalized_en = ?", (normalized,)
    ).fetchone()

    if existing:
        print(f"[ERROR] Term already exists: '{term_en}' (ID: {existing['id']})")
        conn.close()
        return False

    # Get next sequential ID
    max_id = cursor.execute("SELECT MAX(id) FROM terms").fetchone()[0]
    next_id = (max_id or 0) + 1

    # Insert term
    cursor.execute(
        "INSERT INTO terms (id, term_en, category, normalized_en, notes) VALUES (?, ?, ?, ?, ?)",
        (next_id, term_en, category, normalized, notes)
    )
    term_id = next_id

    # Insert translations if provided
    if translations:
        for lang, trans in translations.items():
            cursor.execute(
                "INSERT INTO translations (term_id, language, translation, verified, source) VALUES (?, ?, ?, 0, 'user')",
                (term_id, lang, trans)
            )

    conn.commit()
    conn.close()
    print(f"[OK] Term added: '{term_en}' (ID: {term_id})")
    return True

def delete_term(term_id):
    """Delete a term and all its translations."""
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM translations WHERE term_id = ?", (term_id,))
    cursor.execute("DELETE FROM terms WHERE id = ?", (term_id,))
    conn.commit()
    conn.close()
    print(f"[OK] Term {term_id} deleted")

def verify_term(term_id, language=None):
    """Mark term translations as verified."""
    conn = get_db()
    cursor = conn.cursor()

    if language:
        cursor.execute(
            "UPDATE translations SET verified = 1, verified_date = ? WHERE term_id = ? AND language = ?",
            (datetime.now().isoformat(), term_id, language)
        )
    else:
        cursor.execute(
            "UPDATE translations SET verified = 1, verified_date = ? WHERE term_id = ?",
            (datetime.now().isoformat(), term_id)
        )

    conn.commit()
    conn.close()
    print(f"[OK] Term {term_id} translations verified")

def export_csv(lang=None, output_file=None):
    """Export terms and translations to CSV for review."""
    conn = get_db()
    cursor = conn.cursor()

    if output_file is None:
        output_file = SQL_PATH.parent / ".tmp" / f"glossary_export_{lang or 'all'}.csv"

    rows = cursor.execute("""
        SELECT t.id, t.term_en, t.category, t.notes, tr.language, tr.translation, tr.verified, tr.source
        FROM terms t
        LEFT JOIN translations tr ON t.id = tr.term_id
        WHERE (? IS NULL OR tr.language = ?)
        ORDER BY t.category, t.term_en, tr.language
    """, (lang, lang)).fetchall()

    with open(output_file, "w", encoding="utf-8", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["term_id", "term_en", "category", "notes", "language", "translation", "verified", "source"])
        for row in rows:
            writer.writerow([row["id"], row["term_en"], row["category"], row["notes"] or "", row["language"] or "", row["translation"] or "", row["verified"] or 0, row["source"] or ""])

    print(f"[OK] Exported {len(rows)} rows to {output_file}")
    conn.close()

def import_csv(input_file):
    """Import translations from CSV (for expert review workflow)."""
    conn = get_db()
    cursor = conn.cursor()

    with open(input_file, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        count = 0
        for row in reader:
            term_id = int(row["term_id"])
            language = row["language"]
            translation = row["translation"]
            verified = int(row.get("verified", 0))

            if language and translation:
                cursor.execute(
                    "UPDATE translations SET translation = ?, verified = ?, verified_date = ?, source = 'review_import' WHERE term_id = ? AND language = ?",
                    (translation, verified, datetime.now().isoformat(), term_id, language)
                )
                count += 1

    conn.commit()
    conn.close()
    print(f"[OK] Imported {count} translations from {input_file}")

def get_translation(term_en, language):
    """Get a specific translation for a term."""
    conn = get_db()
    cursor = conn.cursor()

    normalized = term_en.lower().strip()
    row = cursor.execute("""
        SELECT tr.translation, tr.verified, tr.source
        FROM terms t
        JOIN translations tr ON t.id = tr.term_id
        WHERE t.normalized_en = ? AND tr.language = ? AND tr.is_preferred = 1
    """, (normalized, language)).fetchone()

    conn.close()
    return dict(row) if row else None

def get_all_translations(language):
    """Get all translations for a language as a dict."""
    conn = get_db()
    cursor = conn.cursor()

    rows = cursor.execute("""
        SELECT t.normalized_en, tr.translation
        FROM terms t
        JOIN translations tr ON t.id = tr.term_id
        WHERE tr.language = ? AND tr.is_preferred = 1
    """, (language,)).fetchall()

    conn.close()
    return {row["normalized_en"]: row["translation"] for row in rows}

def find_terms_in_text(text):
    """Find all glossary terms in a text. Returns list of (term, normalized, start, end)."""
    conn = get_db()
    cursor = conn.cursor()

    # Get all terms ordered by length (longest first for proper matching)
    rows = cursor.execute(
        "SELECT term_en, normalized_en FROM terms ORDER BY LENGTH(normalized_en) DESC"
    ).fetchall()

    text_lower = text.lower()
    matches = []

    for row in rows:
        normalized = row["normalized_en"]
        # Find all occurrences
        start = 0
        while True:
            pos = text_lower.find(normalized, start)
            if pos == -1:
                break
            # Check it's not part of a longer match already found
            overlap = False
            for m in matches:
                if pos >= m[2] and pos + len(normalized) <= m[3]:
                    overlap = True
                    break
            if not overlap:
                matches.append((row["term_en"], normalized, pos, pos + len(normalized)))
            start = pos + 1

    conn.close()
    return matches

def main():
    parser = argparse.ArgumentParser(description="Glossary Manager Tool")
    parser.add_argument("operation", choices=["init", "seed", "search", "add", "list", "export", "import", "verify"])
    parser.add_argument("--term", help="Term to search/add")
    parser.add_argument("--category", choices=CATEGORIES, help="Category for add/list")
    parser.add_argument("--lang", choices=LANGUAGES, help="Language filter")
    parser.add_argument("--file", help="File for import/export")
    parser.add_argument("--id", type=int, help="Term ID for verify")
    parser.add_argument("--translations", help="Translations as JSON string")

    args = parser.parse_args()

    if args.operation == "init":
        init_db()
    elif args.operation == "search":
        if not args.term:
            print("[ERROR] --term required for search")
        else:
            search_term(args.term)
    elif args.operation == "list":
        list_terms(args.category)
    elif args.operation == "add":
        if not args.term or not args.category:
            print("[ERROR] --term and --category required for add")
        else:
            translations = None
            if args.translations:
                import json
                translations = json.loads(args.translations)
            add_term(args.term, args.category, translations)
    elif args.operation == "verify":
        if not args.id:
            print("[ERROR] --id required for verify")
        else:
            verify_term(args.id, args.lang)
    elif args.operation == "export":
        export_csv(args.lang, args.file)
    elif args.operation == "import":
        if not args.file:
            print("[ERROR] --file required for import")
        else:
            import_csv(args.file)

if __name__ == "__main__":
    main()