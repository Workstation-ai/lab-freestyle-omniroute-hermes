# Lab: Freestyle OmniRoute + Hermes

Remote AI provider gateway for Hermes Agent and OpenCode, deployed on Freestyle.sh VMs.

## Quick Start

```bash
# 1. Deploy OmniRoute to Freestyle VM
./scripts/setup.sh --vm-name omniroute-gw --domain omniroute.workstation.ai

# 2. Configure local Hermes/OpenCode
./scripts/configure-local.sh https://omniroute.workstation.ai/v1

# 3. Verify
./scripts/smoke-test.sh https://omniroute.workstation.ai/v1
```

## Architecture

```
Local Machine (Hermes / OpenCode)
    ↓
https://<freestyle-vm>/v1  (remote endpoint)
    ↓
OmniRoute Gateway (Docker)
    ↓
291+ AI providers (auto-routed)
```

## Why Remote?

- **One gateway serves the whole team** — no local OmniRoute per machine
- **More resources** — Freestyle VMs have more CPU/RAM than most dev laptops
- **Zero local setup** — each machine just points to the endpoint
- **Automatic failover** — Freestyle restarts VMs on crash

## Documentation

- [Setup Guide](docs/setup.md) — Full deployment instructions
- [Configuration](docs/configuration.md) — Hermes, OpenCode, model selection
- [Troubleshooting](docs/troubleshooting.md) — Common issues and fixes

## Repository Structure

```
├── AGENTS.md              # AI agent instructions & memory protocol
├── README.md              # This file
├── docker-compose.yml     # OmniRoute container config
├── config/
│   └── hermes-omnirouter.example.yaml  # Config template
├── scripts/
│   ├── setup.sh           # Deploy to Freestyle VM
│   ├── configure-local.sh # Point local clients at remote gateway
│   └── smoke-test.sh      # Verify endpoint health
└── docs/                  # Detailed documentation
```

## License

Internal — Workstation Inc.
