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

## Repository Structure

```
├── AGENTS.md                  # Agent routing (thin — references only)
├── README.md
├── docker-compose.yml
├── config/
│   └── hermes-omnirouter.example.yaml
├── scripts/
│   ├── setup.sh               # Deploy to Freestyle VM
│   ├── configure-local.sh     # Point local clients at remote gateway
│   └── smoke-test.sh          # Verify endpoint health
└── docs/
    ├── setup.md               # Deployment guide
    ├── FORMATS.md             # Record templates (read when writing)
    ├── decisions/             # Decision records
    ├── discoveries/           # Bug/discovery records
    ├── conventions/           # Pattern records
    └── skills/                # Agent skills (agentskills.io format)
        ├── freestyle-vm/
        │   └── SKILL.md
        ├── omniroute/
        │   └── SKILL.md
        ├── hermes-config/
        │   └── SKILL.md
        └── docker-deploy/
            └── SKILL.md
```

## License

Internal — Workstation Inc.
