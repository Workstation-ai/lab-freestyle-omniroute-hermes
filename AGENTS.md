# Lab Freestyle OmniRoute + Hermes

Remote AI provider gateway on Freestyle.sh VMs for Hermes Agent and OpenCode.

## Stack

Docker · OmniRoute v3.8.49 · Freestyle.sh · Bash

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
| `freestyle-vm` | VM create/manage/ssh | `cat docs/skills/freestyle-vm/SKILL.md` |
| `omniroute` | Gateway config, routing | `cat docs/skills/omniroute/SKILL.md` |
| `hermes-config` | Local client setup | `cat docs/skills/hermes-config/SKILL.md` |
| `docker-deploy` | Container lifecycle | `cat docs/skills/docker-deploy/SKILL.md` |

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

## Commits

Conventional commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`

Never commit: `.env`, private keys, VM IPs, API keys.
