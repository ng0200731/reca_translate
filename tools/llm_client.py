"""
Multi-LLM Client for Garment Translation

Supports: OpenAI, Anthropic (Claude), DeepL, OpenRouter
All backends receive glossary terms as constraints.

Settings are stored in .tmp/llm_settings.json and override .env values.
"""
import json
import os
from abc import ABC, abstractmethod
from pathlib import Path

from dotenv import load_dotenv

load_dotenv(Path(__file__).parent.parent / ".env")

SETTINGS_PATH = Path(__file__).parent.parent / ".tmp" / "llm_settings.json"

LANGUAGE_NAMES = {
    "es": "Spanish", "fr": "French", "de": "German",
    "ko": "Korean", "zh-CN": "Chinese (Simplified)", "ja": "Japanese",
}

SYSTEM_PROMPT = """You are a professional translator specializing in the garment and textile industry.
Your task is to translate fabric content and care instruction labels from English to {target_language}.

CRITICAL RULES:
1. Use ONLY the industry-standard terminology provided in the glossary below.
2. Fabric names (cotton, polyester, elastane, etc.) MUST use the exact glossary translation.
3. Care instructions (machine wash, tumble dry, do not bleach, etc.) MUST use the exact glossary translation.
4. Maintain the same structure and formatting as the source text.
5. Keep percentage values unchanged (e.g., "95% Cotton" → "95% [translated Cotton]").
6. Keep any codes or symbols unchanged.
7. Use the formal register appropriate for garment care labels in {target_language}.

GLOSSARY (use these exact translations):
{glossary}

If a term appears in the glossary, you MUST use that exact translation — do not paraphrase or substitute.
For terms NOT in the glossary, translate accurately using standard {target_language} garment industry terminology."""


def load_settings():
    """Load LLM settings from .tmp/llm_settings.json."""
    if SETTINGS_PATH.exists():
        with open(SETTINGS_PATH, "r", encoding="utf-8") as f:
            return json.load(f)
    return {}


def save_settings(settings: dict):
    """Save LLM settings to .tmp/llm_settings.json."""
    SETTINGS_PATH.parent.mkdir(parents=True, exist_ok=True)
    with open(SETTINGS_PATH, "w", encoding="utf-8") as f:
        json.dump(settings, f, indent=2, ensure_ascii=False)


def get_api_key(provider: str) -> str:
    """Get API key from settings file, falling back to .env."""
    settings = load_settings()
    providers = settings.get("providers", {})
    if provider in providers and providers[provider].get("api_key"):
        return providers[provider]["api_key"]
    env_map = {
        "openai": "OPENAI_API_KEY",
        "anthropic": "ANTHROPIC_API_KEY",
        "deepl": "DEEPL_API_KEY",
        "openrouter": "OPENROUTER_API_KEY",
        "libretranslate": "LIBRETRANSLATE_API_KEY",
    }
    return os.environ.get(env_map.get(provider, ""), "")


def get_base_url(provider: str) -> str:
    """Get base URL from settings, falling back to defaults."""
    settings = load_settings()
    providers = settings.get("providers", {})
    if provider in providers and providers[provider].get("base_url"):
        return providers[provider]["base_url"]
    defaults = {
        "openrouter": "https://openrouter.ai/api/v1",
        "openai": "https://api.openai.com/v1",
        "gemini": "https://generativelanguage.googleapis.com/v1beta/openai/",
        "libretranslate": "http://localhost:5001",
    }
    return defaults.get(provider, "")


def get_model(provider: str) -> str:
    """Get model from settings, falling back to defaults."""
    settings = load_settings()
    providers = settings.get("providers", {})
    if provider in providers and providers[provider].get("model"):
        return providers[provider]["model"]
    defaults = {
        "openai": "gpt-4o",
        "anthropic": "claude-sonnet-4-20250514",
        "openrouter": "nvidia/nemotron-3-super-120b-a12b:free",
        "gemini": "gemini-2.0-flash",
        "deepl": "",
        "libretranslate": "",
    }
    return defaults.get(provider, "")


class LLMBackend(ABC):
    @abstractmethod
    def translate(self, text: str, target_language: str, glossary: str) -> tuple[str, str]:
        """Returns (translated_text, model_used)"""
        pass

    @abstractmethod
    def name(self) -> str:
        pass


class OpenAIBackend(LLMBackend):
    def name(self):
        return "openai"

    def translate(self, text: str, target_language: str, glossary: str) -> tuple[str, str]:
        import openai

        api_key = get_api_key("openai")
        if not api_key:
            raise ValueError("OpenAI API key not set. Configure in Settings page.")

        model = get_model("openai")
        lang = LANGUAGE_NAMES.get(target_language, target_language)
        system = SYSTEM_PROMPT.format(target_language=lang, glossary=glossary)

        client = openai.OpenAI(api_key=api_key)
        response = client.chat.completions.create(
            model=model,
            messages=[
                {"role": "system", "content": system},
                {"role": "user", "content": text}
            ],
            temperature=0.1,
        )
        return response.choices[0].message.content.strip(), model


class AnthropicBackend(LLMBackend):
    def name(self):
        return "anthropic"

    def translate(self, text: str, target_language: str, glossary: str) -> tuple[str, str]:
        import anthropic

        api_key = get_api_key("anthropic")
        if not api_key:
            raise ValueError("Anthropic API key not set. Configure in Settings page.")

        model = get_model("anthropic")
        lang = LANGUAGE_NAMES.get(target_language, target_language)
        system = SYSTEM_PROMPT.format(target_language=lang, glossary=glossary)

        client = anthropic.Anthropic(api_key=api_key)
        response = client.messages.create(
            model=model,
            max_tokens=1024,
            system=system,
            messages=[{"role": "user", "content": text}],
        )
        return response.content[0].text.strip(), model


class DeepLBackend(LLMBackend):
    def name(self):
        return "deepl"

    def translate(self, text: str, target_language: str, glossary: str) -> tuple[str, str]:
        import deepl

        api_key = get_api_key("deepl")
        if not api_key:
            raise ValueError("DeepL API key not set. Configure in Settings page.")

        lang_code_map = {"es": "ES", "fr": "FR", "de": "DE", "ko": "KO", "zh-CN": "ZH", "ja": "JA"}

        translator = deepl.Translator(api_key)
        result = translator.translate_text(
            text,
            target_lang=lang_code_map.get(target_language, target_language.upper()),
            context=glossary[:500] if glossary else None,
        )
        return result.text, "deepl"


class OpenRouterBackend(LLMBackend):
    """OpenRouter uses OpenAI-compatible API, supports many free models.
    Automatically falls through all free models if one fails."""

    def name(self):
        return "openrouter"

    def _try_model(self, client, model, system, text):
        response = client.chat.completions.create(
            model=model,
            messages=[
                {"role": "system", "content": system},
                {"role": "user", "content": text}
            ],
            temperature=0.1,
        )
        return response.choices[0].message.content.strip()

    def translate(self, text: str, target_language: str, glossary: str) -> tuple[str, str]:
        import openai

        api_key = get_api_key("openrouter")
        if not api_key:
            raise ValueError("OpenRouter API key not set. Configure in Settings page.")

        base_url = get_base_url("openrouter")
        preferred_model = get_model("openrouter")
        lang = LANGUAGE_NAMES.get(target_language, target_language)
        system = SYSTEM_PROMPT.format(target_language=lang, glossary=glossary)

        client = openai.OpenAI(api_key=api_key, base_url=base_url)

        # Build model list: preferred first, then the rest as fallbacks
        models = [preferred_model]
        for m in OPENROUTER_FREE_MODELS:
            if m != preferred_model:
                models.append(m)

        last_error = None
        for model in models:
            try:
                result = self._try_model(client, model, system, text)
                return result, model
            except Exception as e:
                last_error = e
                continue

        raise RuntimeError(f"All OpenRouter models failed. Last error: {last_error}")


class GeminiBackend(LLMBackend):
    """Google Gemini via OpenAI-compatible API."""

    def name(self):
        return "gemini"

    def translate(self, text: str, target_language: str, glossary: str) -> tuple[str, str]:
        import openai

        api_key = get_api_key("gemini")
        if not api_key:
            raise ValueError("Gemini API key not set. Configure in Settings page.")

        model = get_model("gemini")
        lang = LANGUAGE_NAMES.get(target_language, target_language)
        system = SYSTEM_PROMPT.format(target_language=lang, glossary=glossary)

        client = openai.OpenAI(
            api_key=api_key,
            base_url="https://generativelanguage.googleapis.com/v1beta/openai/"
        )
        response = client.chat.completions.create(
            model=model,
            messages=[
                {"role": "system", "content": system},
                {"role": "user", "content": text}
            ],
            temperature=0.1,
        )
        return response.choices[0].message.content.strip(), model


class LibreTranslateBackend(LLMBackend):
    """LibreTranslate: self-hosted open-source MT API."""

    LANG_CODE_MAP = {
        "es": "es", "fr": "fr", "de": "de",
        "ja": "ja", "ko": "ko", "zh-CN": "zh",
    }

    def name(self):
        return "libretranslate"

    def translate(self, text: str, target_language: str, glossary: str) -> tuple[str, str]:
        import requests

        base_url = get_base_url("libretranslate") or "http://localhost:5001"
        api_key = get_api_key("libretranslate")

        lt_target = self.LANG_CODE_MAP.get(target_language, target_language)

        payload = {
            "q": text,
            "source": "en",
            "target": lt_target,
            "format": "text",
        }
        if api_key:
            payload["api_key"] = api_key

        resp = requests.post(
            f"{base_url.rstrip('/')}/translate",
            json=payload,
            timeout=60,
        )
        resp.raise_for_status()
        translated = resp.json()["translatedText"]
        return translated.strip(), "libretranslate"


BACKENDS = {
    "openai": OpenAIBackend,
    "anthropic": AnthropicBackend,
    "deepl": DeepLBackend,
    "openrouter": OpenRouterBackend,
    "gemini": GeminiBackend,
    "libretranslate": LibreTranslateBackend,
}

# Free models available on OpenRouter (verified April 2026)
OPENROUTER_FREE_MODELS = [
    "nvidia/nemotron-3-super-120b-a12b:free",
    "tencent/hy3-preview:free",
    "z-ai/glm-4.5-air:free",
    "openai/gpt-oss-120b:free",
    "minimax/minimax-m2.5:free",
    "nvidia/nemotron-3-nano-30b-a3b:free",
    "nvidia/nemotron-nano-9b-v2:free",
]


def get_selected_openrouter_models():
    """Get the list of user-selected OpenRouter models from settings."""
    settings = load_settings()
    providers = settings.get("providers", {})
    or_config = providers.get("openrouter", {})
    models = or_config.get("models", [])
    if models:
        return models
    # Fallback: just the preferred model
    m = get_model("openrouter")
    return [m] if m else []


def get_backend(name: str) -> LLMBackend:
    cls = BACKENDS.get(name)
    if not cls:
        raise ValueError(f"Unknown backend: {name}. Available: {list(BACKENDS.keys())}")
    return cls()


def list_backends():
    """List available backends based on configured API keys or base URLs."""
    KEYLESS_PROVIDERS = {"libretranslate"}
    available = []
    for provider in BACKENDS:
        if provider in KEYLESS_PROVIDERS:
            if get_base_url(provider):
                available.append(provider)
        elif get_api_key(provider):
            available.append(provider)
    return available


def get_provider_info():
    """Get all provider info for settings page."""
    settings = load_settings()
    providers = settings.get("providers", {})
    info = {}
    for name in BACKENDS:
        p = providers.get(name, {})
        has_key = bool(p.get("api_key") or get_api_key(name))
        if not has_key and name == "libretranslate":
            has_key = bool(p.get("base_url") or get_base_url(name))
        info[name] = {
            "api_key": p.get("api_key", "") or get_api_key(name),
            "base_url": p.get("base_url", "") or get_base_url(name),
            "model": p.get("model", "") or get_model(name),
            "models": p.get("models", []),
            "has_key": has_key,
        }
    return info
