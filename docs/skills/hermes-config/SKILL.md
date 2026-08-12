---
name: hermes-config
description: Configure local Hermes Agent and OpenCode to use a remote OmniRoute endpoint. Use when setting up a new machine or changing the endpoint URL.
---

# Local Client Configuration

## Hermes Agent

Config: `~/.hermes/config.yaml`

```yaml
model:
  provider: custom
  base_url: <endpoint-url>/v1
  api_key: ""
  default: auto/best-coding
```

## OpenCode

Config: `~/.config/opencode/opencode.json`

Set the provider and base_url in the provider section.

## Quick Setup

```bash
./scripts/configure-local.sh <endpoint-url>
```

## Verify

```bash
curl <endpoint-url>/v1/models
```
