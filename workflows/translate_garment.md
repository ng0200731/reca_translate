# Workflow: Translate Garment Content

## Objective
Translate fabric content and care instructions from English to target languages with verified terminology accuracy.

## Inputs
- `text`: English source text (fabric composition, care instructions)
- `languages`: List of target language codes (es, fr, de, ko, zh-CN, ja)
- `backend`: LLM backend to use (openai, anthropic, deepl)

## Steps

### 1. Pre-process input text
- Normalize whitespace
- Preserve percentage values and care codes
- Split into logical sections if needed (composition / care)

### 2. Extract glossary terms
- Match input against `terms` table (case-insensitive)
- Prioritize longest match first (prevent "machine wash" matching "machine" separately)
- List matched terms for context

### 3. Build glossary context
- For each target language, compile all glossary translations
- Include in LLM system prompt as mandatory translations

### 4. Call translation API
- Send text + glossary context to selected LLM backend
- System prompt enforces use of glossary terminology
- Temperature set to 0.1 for deterministic output

### 5. Post-process results
- Verify glossary terms appear correctly in output
- Flag any terms that may not use verified translations
- Preserve original formatting and structure

### 6. Return formatted output
- One result per language
- Include warnings for unverified/missing terms
- Allow copy for each translation

## Error Handling
- If API fails: Return error with message, suggest trying another backend
- If unknown term: LLM translates it, flagged for future glossary addition
- If backend not configured: Show available backends, prompt to set API key

## Quality Assurance
- Compare output against known-correct translations for common phrases
- Glossary terms always take precedence over LLM suggestions
- Unverified terms should be reviewed by native speakers using the glossary management page
