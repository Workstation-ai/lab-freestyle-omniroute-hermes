---
name: vm-operations
description: >
  Generic VM lifecycle operations: create, start, stop, delete, SSH, exec.
  Use as base for provider-specific VM skills. Not invoked directly —
  use a specific VM skill (freestyle-vm, aws-ec2, etc.) instead.
scope: generic
---

# VM Operations (Generic)

Base skill for all VM providers. Specific skills extend this.

## Universal Operations

Every VM provider supports these concepts:

| Concept | Generic command | Provider maps to |
|---------|----------------|------------------|
| List | `provider vm list` | freestyle vm list |
| Create | `provider vm create <name>` | freestyle vm create <name> --docker |
| Status | `provider vm status <name>` | freestyle vm status <name> |
| SSH | `provider vm ssh <name>` | freestyle vm ssh <name> |
| Exec | `provider vm exec <name> "<cmd>"` | freestyle vm exec <name> "<cmd>" |
| Delete | `provider vm delete <name>` | freestyle vm delete <name> |

## Health Check Pattern

```bash
# Universal: check if a port is responding inside a VM
provider vm exec <name> "curl -sf http://localhost:<port>/health"
```

## Troubleshooting Pattern

1. Check status: `provider vm status <name>`
2. Check logs: `provider vm exec <name> "journalctl -u <service> --tail 50"`
3. Check ports: `provider vm exec <name> "ss -tlnp"`
