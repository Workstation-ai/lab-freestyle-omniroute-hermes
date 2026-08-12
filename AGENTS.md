# Lab Freestyle OmniRoute + Hermes

Remote AI provider gateway on Freestyle.sh VMs for Hermes Agent and OpenCode.

## Stack

Docker · OmniRoute v3.8.49 · Freestyle.sh · Bash

## Security Rules

**Memories and records must NEVER contain:**

- API keys, tokens, passwords, secrets
- Private keys, certificates, credentials
- VM IP addresses (use domain names)
- `.env` contents with real values

**If a value is sensitive, redact it:** `<REDACTED>` or use a placeholder like `YOUR_KEY_HERE`.

Violation = immediate incident. No exceptions.

## Entry Points

Every command below reads exactly what's needed — no more.

### Records (read format before writing)

| What | Command |
|------|---------|
| Decision template | `sed -n '5,25p' docs/FORMATS.md` |
| Discovery template | `sed -n '27,46p' docs/FORMATS.md` |
| Convention template | `sed -n '48,61p' docs/FORMATS.md` |

### Skills (read when task matches trigger)

| Skill | Trigger | Command |
|-------|---------|---------|
| `vm-operations` | Generic VM concepts | `cat docs/skills/vm-operations/SKILL.md` |
| `container-operations` | Generic container concepts | `cat docs/skills/container-operations/SKILL.md` |
| `freestyle-vm` | Freestyle VM specifically | `cat docs/skills/freestyle-vm/SKILL.md` |
| `omniroute` | Gateway config, routing | `cat docs/skills/omniroute/SKILL.md` |
| `hermes-config` | Local client setup | `cat docs/skills/hermes-config/SKILL.md` |
| `docker-deploy` | Docker on Freestyle VM | `cat docs/skills/docker-deploy/SKILL.md` |

### Records index

| Type | Path | Listing command |
|------|------|-----------------|
| Decisions | `docs/decisions/` | `ls docs/decisions/` |
| Discoveries | `docs/discoveries/` | `ls docs/discoveries/` |
| Conventions | `docs/conventions/` | `ls docs/conventions/` |

### Write locations

| Record type | Create at |
|-------------|-----------|
| Decision | `docs/decisions/YYYY-MM-DD-<topic>.md` |
| Discovery | `docs/discoveries/YYYY-MM-DD-<topic>.md` |
| Convention | `docs/conventions/YYYY-MM-DD-<topic>.md` |

## Skill Design

Skills follow [agentskills.io](https://agentskills.io) format.

**Design principles** (read `sed -n '1,40p' docs/SKILL-DESIGN.md` for full spec):

- **Reusable first**: a skill solves one problem well, across contexts
- **Scope in description**: if domain-specific, say so explicitly
- **Inherit, don't duplicate**: specific skills extend generic ones, not copy them
- **Minimal frontmatter**: name + description are the contract

## Commits

Conventional commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`

Never commit: `.env`, private keys, VM IPs, API keys.
