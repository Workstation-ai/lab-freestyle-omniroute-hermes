#!/usr/bin/env bash
# configure-local.sh — Point local Hermes/OpenCode at the remote OmniRoute VM
#
# Usage:
#   ./scripts/configure-local.sh <endpoint-url>
#
# Example:
#   ./scripts/configure-local.sh https://omniroute.workstation.ai/v1
#   ./scripts/configure-local.sh http://203.0.113.42:20128/v1

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <endpoint-url>"
  echo "Example: $0 https://omniroute.workstation.ai/v1"
  exit 1
fi

ENDPOINT="$1"

# Ensure URL ends with /v1
if [[ "$ENDPOINT" != */v1 ]]; then
  ENDPOINT="$ENDPOINT/v1"
fi

echo "🔧 Configuring local clients to use: $ENDPOINT"

# --- Hermes ---
HERMES_CONFIG="$HOME/.hermes/config.yaml"
if [ -f "$HERMES_CONFIG" ]; then
  echo "→ Backing up Hermes config..."
  cp "$HERMES_CONFIG" "$HERMES_CONFIG.bak.$(date +%s)"
fi

mkdir -p "$HOME/.hermes"
cat > "$HERMES_CONFIG" << EOF
model:
  provider: custom
  base_url: $ENDPOINT
  api_key: ""
  default: auto/best-coding
EOF
echo "  ✅ Hermes config written to $HERMES_CONFIG"

# --- OpenCode ---
OPENCODE_CONFIG="$HOME/.config/opencode/opencode.json"
if [ -f "$OPENCODE_CONFIG" ]; then
  echo "→ OpenCode config found at $OPENCODE_CONFIG"
  echo "  ℹ️  Update manually or re-run with --opencode flag"
fi

echo ""
echo "════════════════════════════════════════════════"
echo "  Configuration Complete"
echo "════════════════════════════════════════════════"
echo "  Endpoint: $ENDPOINT"
echo "  Model:    auto/best-coding"
echo ""
echo "  Test with:"
echo "    curl $ENDPOINT/v1/models"
echo "════════════════════════════════════════════════"
