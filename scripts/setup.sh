#!/usr/bin/env bash
# setup.sh — Install and boot OmniRoute on a Freestyle VM
#
# Usage:
#   ./scripts/setup.sh [--vm-name NAME] [--domain DOMAIN]
#
# Prerequisites:
#   - Freestyle CLI installed and authenticated
#   - Docker available on the target VM

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

# --- Defaults ---
VM_NAME="omniroute-gw"
DOMAIN=""
COMPOSE_FILE="$REPO_ROOT/docker-compose.yml"

# --- Parse args ---
while [[ $# -gt 0 ]]; do
  case $1 in
    --vm-name) VM_NAME="$2"; shift 2 ;;
    --domain) DOMAIN="$2"; shift 2 ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

echo "🔧 Setting up OmniRoute on Freestyle VM: $VM_NAME"

# 1. Create VM (idempotent)
echo "→ Creating VM..."
freestyle vm create "$VM_NAME" --docker 2>/dev/null || echo "  VM already exists, continuing..."

# 2. Upload docker-compose
echo "→ Uploading docker-compose.yml..."
freestyle vm exec "$VM_NAME" "mkdir -p /opt/omniroute"
cat "$COMPOSE_FILE" | freestyle vm exec "$VM_NAME" "cat > /opt/omniroute/docker-compose.yml"

# 3. Start OmniRoute
echo "→ Starting OmniRoute container..."
freestyle vm exec "$VM_NAME" "cd /opt/omniroute && docker compose up -d"

# 4. Wait for health
echo "→ Waiting for health check..."
for i in $(seq 1 30); do
  if freestyle vm exec "$VM_NAME" "curl -sf http://localhost:20128/v1/models" >/dev/null 2>&1; then
    echo "  ✅ OmniRoute is healthy"
    break
  fi
  if [ "$i" -eq 30 ]; then
    echo "  ❌ OmniRoute failed to start"
    exit 1
  fi
  sleep 2
done

# 5. Optional: Map domain
if [ -n "$DOMAIN" ]; then
  echo "→ Mapping domain $DOMAIN → port 20128..."
  freestyle vm domain map "$VM_NAME" "$DOMAIN" 20128
  echo "  ✅ Endpoint: https://$DOMAIN/v1"
fi

# 6. Print connection info
VM_IP=$(freestyle vm ip "$VM_NAME" 2>/dev/null || echo "use-domain")
echo ""
echo "════════════════════════════════════════════════"
echo "  OmniRoute Gateway Ready"
echo "════════════════════════════════════════════════"
echo "  VM:        $VM_NAME"
if [ -n "$DOMAIN" ]; then
  echo "  Endpoint:  https://$DOMAIN/v1"
else
  echo "  Endpoint:  http://$VM_IP:20128/v1"
fi
echo "  Models:    curl http://<endpoint>/v1/models"
echo ""
echo "  Configure Hermes/OpenCode:"
if [ -n "$DOMAIN" ]; then
  echo "    base_url: https://$DOMAIN/v1"
else
  echo "    base_url: http://$VM_IP:20128/v1"
fi
echo "════════════════════════════════════════════════"
