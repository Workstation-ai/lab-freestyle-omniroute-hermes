---
name: omniroute
description: Configure OmniRoute gateway routing, model selection, and provider settings. Use when changing models, debugging routing issues, or updating the gateway.
---

# OmniRoute Configuration

## Model Selection

| Model | Context | Use |
|-------|---------|-----|
| `auto/best-coding` | varies | Recommended — best provider per request |
| `auto/best-chat` | varies | Optimized for chat |
| `google/gemini-2.5-flash` | 1M | Stable, free |
| `meta-llama/llama-3.3-70b-versatile` | 128k | Stable, open source |

## Common Operations

```bash
# Check available models
curl http://<endpoint>/v1/models

# Test a request
curl http://<endpoint>/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{"model":"auto/best-coding","messages":[{"role":"user","content":"hello"}]}'

# View OmniRoute logs (on VM)
freestyle vm exec <name> "docker logs omniroute --tail 50"

# Restart OmniRoute
freestyle vm exec <name> "docker restart omniroute"
```

## Troubleshooting

- 503 errors: backend overloaded, wait 30s or restart
- 401 errors: using plain `auto`, switch to `auto/best-coding`
- High latency: pin a specific model instead of auto-routing
