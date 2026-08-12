---
name: docker-deploy
description: >
  Docker Compose deployment on Freestyle VMs. Extends container-operations
  with Docker-specific compose commands and OmniRoute container management.
  Use when starting, stopping, or debugging Docker containers on the VM.
scope: docker on freestyle
extends: container-operations
---

# Docker Deployment

Extends [container-operations](../container-operations/SKILL.md) with Docker-specific commands.

## Docker Compose on Freestyle VM

```bash
# Start OmniRoute
freestyle vm exec <name> "cd /opt/omniroute && docker compose up -d"

# Stop
freestyle vm exec <name> "cd /opt/omniroute && docker compose down"

# Restart
freestyle vm exec <name> "cd /opt/omniroute && docker compose restart"

# Logs
freestyle vm exec <name> "docker logs omniroute --tail 100"

# Status
freestyle vm exec <name> "docker ps"
```

## Troubleshooting

- Container exits immediately: check logs, usually port conflict
- Can't connect: verify container running with `docker ps`
- Health check fails: wait 15s for startup, then check logs
