# Lab Freestyle OmniRoute + Hermes — AI Agent Instructions

## Project Overview

This project deploys OmniRoute as a remote AI provider gateway on Freestyle.sh VMs.
It serves Hermes Agent, OpenCode, and any OpenAI-compatible client.

**Stack:** Docker, OmniRoute v3.8.49, Freestyle.sh VMs, Bash scripts

## Agent Memory Protocol

All agents working in this repo MUST follow this memory protocol.

### Directory Structure for Memory

```
docs/
├── decisions/          # Architecture and design decisions
│   └── YYYY-MM-DD-topic.md
├── discoveries/        # Non-obvious findings, gotchas, bugs
│   └── YYYY-MM-DD-topic.md
├── conventions/        # Team conventions, patterns established
│   └── YYYY-MM-DD-topic.md
└── setup.md            # Deployment guide ( living doc)
```

### Decision Record Format

When making a significant decision, create a file in `docs/decisions/`:

```markdown
# Decision: [Title]

**Date:** YYYY-MM-DD
**Status:** proposed | accepted | superseded
**Context:** [Why this decision was needed]
**Decision:** [What was decided]
**Alternatives Considered:**
- [Option A] — rejected because [reason]
- [Option B] — rejected because [reason]
**Consequences:** [What this means for the project]
```

### Discovery Record Format

When finding something non-obvious, create a file in `docs/discoveries/`:

```markdown
# Discovery: [Title]

**Date:** YYYY-MM-DD
**Severity:** critical | warning | info
**What happened:** [Description]
**Root cause:** [Why it happened]
**Fix/Workaround:** [How to handle it]
**Prevention:** [How to avoid it next time]
```

### Convention Record Format

When establishing a pattern, create a file in `docs/conventions/`:

```markdown
# Convention: [Title]

**Date:** YYYY-MM-DD
**Scope:** [What this applies to]
**Pattern:** [The convention itself]
**Rationale:** [Why this is better than alternatives]
**Example:**
```[language]
[Code example if applicable]
```

## Memory Triggers

Save a memory record when ANY of these occur:

- Architecture or design decision made
- Deployment configuration changed
- Bug found and fixed
- Non-obvious behavior discovered
- Tool or service choice made with tradeoffs
- Convention established

## Skills

### Available Skills

| Skill | Trigger | Description |
|-------|---------|-------------|
| `freestyle-vm` | VM creation, management, SSH | Deploy and manage Freestyle VMs |
| `omniroute` | Gateway config, routing, providers | Configure OmniRoute routing |
| `hermes-config` | Hermes Agent setup | Configure Hermes to use remote endpoint |
| `docker-deploy` | Container lifecycle | Docker compose operations |

### Skill Loading

Before executing any task, check if a relevant skill exists in the table above.
If yes, read the corresponding skill file (if it exists) before proceeding.

Skill files live in `docs/skills/` (create as needed).

## Working in This Repo

### File Naming

- Scripts: `kebab-case.sh`
- Config: `kebab-case.yaml` or `kebab-case.json`
- Docs: `kebab-case.md`
- Decision/Discovery files: `YYYY-MM-DD-topic.md`

### Commit Messages

Use conventional commits:
- `feat:` new feature or capability
- `fix:` bug fix
- `docs:` documentation only
- `chore:` maintenance, dependency updates
- `refactor:` code restructuring

### What NOT to Commit

- `.env` files with real credentials
- Private keys or certificates
- VM IP addresses (use domain names in docs)
- OmniRoute API keys (if configured)

## Session Close Protocol

Before ending a session, save relevant context:

1. Any decisions made → `docs/decisions/`
2. Any discoveries → `docs/discoveries/`
3. Any conventions established → `docs/conventions/`
4. Update `docs/setup.md` if deployment steps changed

This ensures the next session starts with full context.
