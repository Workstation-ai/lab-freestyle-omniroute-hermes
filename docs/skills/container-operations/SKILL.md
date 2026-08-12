---
name: container-operations
description: >
  Generic container lifecycle operations: start, stop, restart, logs, status.
  Use as base for provider-specific container skills. Not invoked directly —
  use a specific container skill (docker-deploy, podman, etc.) instead.
scope: generic
---

# Container Operations (Generic)

Base skill for all container runtimes. Specific skills extend this.

## Universal Operations

| Concept | Generic command | Docker maps to |
|---------|----------------|----------------|
| Start | `runtime compose up -d` | docker compose up -d |
| Stop | `runtime compose down` | docker compose down |
| Restart | `runtime compose restart` | docker compose restart |
| Logs | `runtime logs <service> --tail N` | docker logs <service> --tail N |
| Status | `runtime ps` | docker ps |
| Health | `curl -sf http://localhost:<port>/health` | curl -sf http://localhost:20128/v1/models |

## Compose Pattern

```bash
# Universal: run a compose stack
cd /opt/<service> && runtime compose up -d

# Universal: check container health
runtime exec <container> "curl -sf http://localhost:<port>/health"
```
