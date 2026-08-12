# Setup Guide

## Prerequisites

- [Freestyle CLI](https://www.freestyle.sh/docs/cli) installed and authenticated
- Docker installed on the target VM (Freestyle VMs support `--docker` flag)
- Port 20128 available on the VM

## Deployment Steps

### 1. Deploy OmniRoute to Freestyle VM

```bash
./scripts/setup.sh --vm-name omniroute-gw
```

With custom domain:

```bash
./scripts/setup.sh --vm-name omniroute-gw --domain omniroute.workstation.ai
```

### 2. Verify Health

```bash
./scripts/smoke-test.sh http://<vm-ip>:20128/v1
```

Or with domain:

```bash
./scripts/smoke-test.sh https://omniroute.workstation.ai/v1
```

### 3. Configure Local Clients

For Hermes:

```bash
./scripts/configure-local.sh https://omniroute.workstation.ai/v1
```

For OpenCode, update `~/.config/opencode/opencode.json`:

```json
{
  "provider": "custom",
  "base_url": "https://omniroute.workstation.ai/v1"
}
```

## VM Management

```bash
# List VMs
freestyle vm list

# Check status
freestyle vm status omniroute-gw

# SSH into VM
freestyle vm ssh omniroute-gw

# Restart OmniRoute
freestyle vm exec omniroute-gw "cd /opt/omniroute && docker compose restart"

# View logs
freestyle vm exec omniroute-gw "docker logs omniroute --tail 50"

# Stop VM
freestyle vm stop omniroute-gw

# Delete VM
freestyle vm delete omniroute-gw
```

## Domain Setup (Optional)

If you want HTTPS access:

1. Verify domain ownership with Freestyle
2. Map domain to VM port:
   ```bash
   freestyle vm domain map omniroute-gw omniroute.workstation.ai 20128
   ```
3. Clients connect via `https://omniroute.workstation.ai/v1`

## Security Considerations

- OmniRoute is **keyless by default** — anyone with the endpoint URL can use it
- For production, consider:
  - WireGuard VPN via Freestyle VPC
  - API key authentication (OmniRoute supports this)
  - Domain restrictions
