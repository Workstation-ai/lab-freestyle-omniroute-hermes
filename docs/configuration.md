# Configuration Reference

## OmniRoute Models

| Model | Context | Use Case |
|-------|---------|----------|
| `auto/best-coding` | varies | **Recommended** — combo model, best provider per request |
| `auto/best-chat` | varies | Combo model, optimized for chat |
| `auto` | varies | Basic auto-routing (may hit broken free tiers) |
| `google/gemini-2.5-flash` | 1M | Production (stable, free) |
| `meta-llama/llama-3.3-70b-versatile` | 128k | Production (stable) |
| `openai/gpt-4o-mini` | 128k | Production (stable) |

## Hermes Configuration

Config file: `~/.hermes/config.yaml`

```yaml
model:
  provider: custom
  base_url: https://omniroute.workstation.ai/v1
  api_key: ""  # keyless by default
  default: auto/best-coding
```

## OpenCode Configuration

Config file: `~/.config/opencode/opencode.json`

```json
{
  "provider": "custom",
  "base_url": "https://omniroute.workstation.ai/v1",
  "api_key": ""
}
```

## Model Selection Guide

**For coding tasks:** Use `auto/best-coding`
- Routes to the best available coding model
- Handles context up to the provider's limit

**For chat tasks:** Use `auto/best-chat`
- Optimized for conversational responses
- May use different providers than coding

**For stability:** Pin a specific model
- `google/gemini-2.5-flash` — 1M context, free, reliable
- `meta-llama/llama-3.3-70b-versatile` — 128k, open source

**Avoid:** Plain `auto`
- Routes to unreliable free tiers
- Frequent 401 errors from `oc/*` prefix models
