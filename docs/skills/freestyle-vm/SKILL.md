---
name: freestyle-vm
description: Create, manage, and SSH into Freestyle.sh VMs. Use when deploying services, checking VM status, or debugging VM issues.
---

# Freestyle VM Management

## Prerequisites

- Freestyle CLI installed and authenticated
- VM naming: `omniroute-gw` (default)

## Common Operations

```bash
# List VMs
freestyle vm list

# Create VM with Docker
freestyle vm create <name> --docker

# Check status
freestyle vm status <name>

# SSH into VM
freestyle vm ssh <name>

# Execute command
freestyle vm exec <name> "<command>"

# Map domain to port
freestyle vm domain map <name> <domain> <port>
```

## Troubleshooting

- VM won't start: check `freestyle vm status` for error state
- Can't SSH: verify auth with `freestyle auth status`
- Port conflict: `freestyle vm exec <name> "ss -tlnp | grep :<port>"`
