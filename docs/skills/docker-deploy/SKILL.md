---
name: docker-deploy
description: Deploy and manage Docker containers on Freestyle VMs. Use when starting, stopping, or debugging OmniRoute containers.
---

# Docker Deployment

## Common Operations

```bash
# Start containers
freestyle vm exec <name> "cd /opt/omniroute && docker compose up -d"

# Stop containers
freestyle vm exec <name> "cd /opt/omniroute && docker compose down"

# Restart
freestyle vm exec <name> "cd /opt/omniroute && docker compose restart"

# View logs
freestyle vm exec <name> "docker logs omniroute --tail 100"

# Check container status
freestyle vm exec <name> "docker ps"

# Health check
freestyle vm exec <name> "curl -sf http://localhost:20128/v1/models"
```

## Troubleshooting

- Container exits immediately: check logs, usually port conflict
- Can't connect: verify container is running with `docker ps`
- Health check fails: wait 15s for startup, then check logs
