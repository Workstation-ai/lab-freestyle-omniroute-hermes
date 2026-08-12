# Lab Freestyle OmniRoute + Hermes

Remote AI provider gateway on Freestyle.sh VMs for Hermes Agent and OpenCode.

## Stack

Docker · OmniRoute v3.8.49 · Freestyle.sh · Bash

## Paths

| What | Where |
|------|-------|
| Skills | `docs/skills/<name>/SKILL.md` |
| Decisions | `docs/decisions/YYYY-MM-DD-<topic>.md` |
| Discoveries | `docs/discoveries/YYYY-MM-DD-<topic>.md` |
| Conventions | `docs/conventions/YYYY-MM-DD-<topic>.md` |
| Format reference | `docs/FORMATS.md` (read only when writing a record) |
| Setup guide | `docs/setup.md` |

## Skills

Skills follow [agentskills.io](https://agentskills.io) format. Each is a folder with `SKILL.md` (YAML frontmatter + markdown body).

| Skill | Trigger |
|-------|---------|
| `freestyle-vm` | VM create/manage/ssh |
| `omniroute` | Gateway config, routing |
| `hermes-config` | Local client setup |
| `docker-deploy` | Container lifecycle |

Load a skill only when the task matches its trigger. Read `docs/skills/<name>/SKILL.md`.

## Memory Protocol

Write a record when you make a decision, find a bug, or establish a pattern.

- **Decision** → `docs/decisions/` — read `docs/FORMATS.md` for the template
- **Discovery** → `docs/discoveries/` — read `docs/FORMATS.md` for the template
- **Convention** → `docs/conventions/` — read `docs/FORMATS.md` for the template

File naming: `YYYY-MM-DD-<short-topic>.md`

## Commits

Conventional commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`

Never commit: `.env`, private keys, VM IPs, API keys.
