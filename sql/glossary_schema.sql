-- Garment Translation Glossary Schema

CREATE TABLE IF NOT EXISTS terms (
    id INTEGER PRIMARY KEY,
    term_en TEXT NOT NULL UNIQUE,
    category TEXT NOT NULL CHECK(category IN ('fabric', 'care_instruction', 'garment_part', 'treatment', 'temperature', 'general')),
    normalized_en TEXT NOT NULL,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS translations (
    id INTEGER PRIMARY KEY,
    term_id INTEGER NOT NULL,
    language TEXT NOT NULL CHECK(language IN ('es', 'fr', 'de', 'ko', 'zh-CN', 'ja')),
    country TEXT NOT NULL DEFAULT '',
    translation TEXT NOT NULL,
    is_preferred BOOLEAN DEFAULT 1,
    verified BOOLEAN DEFAULT 0,
    verified_by TEXT,
    verified_date TEXT,
    source TEXT,
    FOREIGN KEY (term_id) REFERENCES terms(id) ON DELETE CASCADE,
    UNIQUE(term_id, language, country)
);

CREATE TABLE IF NOT EXISTS care_codes (
    id INTEGER PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    symbol_description TEXT NOT NULL,
    category TEXT NOT NULL CHECK(category IN ('washing', 'bleaching', 'drying', 'ironing', 'professional')),
    max_temp_c INTEGER,
    notes TEXT
);

CREATE INDEX IF NOT EXISTS idx_terms_normalized ON terms(normalized_en);
CREATE INDEX IF NOT EXISTS idx_terms_category ON terms(category);
CREATE INDEX IF NOT EXISTS idx_translations_lookup ON translations(term_id, language);
CREATE INDEX IF NOT EXISTS idx_translations_verified ON translations(term_id, verified);
