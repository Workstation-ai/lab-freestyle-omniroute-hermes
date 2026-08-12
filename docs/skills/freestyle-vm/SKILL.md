---
name: freestyle-vm
description: >
  Freestyle.sh VM management. Extends vm-operations with Freestyle-specific
  CLI commands, domain mapping, and Docker VM support. Use when deploying
  to or managing Freestyle VMs specifically.
scope: freestyle.sh
extends: vm-operations
---

# Freestyle VM Management

Extends [vm-operations](../vm-operations/SKILL.md) with Freestyle-specific commands.

## Freestyle-Specific Operations

```bash
# Create VM with Docker support
freestyle vm create <name> --docker

# Map domain to VM port
freestyle vm domain map <name> <domain> <port>

# Auth status
freestyle auth status
```

## Troubleshooting

- VM won't start: `freestyle vm status <name>` for error state
- Can't SSH: `freestyle auth status` — re-authenticate if needed
- Port conflict: `freestyle vm exec <name> "ss -tlnp | grep :<port>"`
