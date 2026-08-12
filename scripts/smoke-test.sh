#!/usr/bin/env bash
# smoke-test.sh — Verify OmniRoute gateway is responding correctly
#
# Usage:
#   ./scripts/smoke-test.sh <endpoint-url>

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <endpoint-url>"
  exit 1
fi

ENDPOINT="$1"
PASS=0
FAIL=0

check() {
  local desc="$1"
  local cmd="$2"
  if eval "$cmd" >/dev/null 2>&1; then
    echo "  ✅ $desc"
    PASS=$((PASS + 1))
  else
    echo "  ❌ $desc"
    FAIL=$((FAIL + 1))
  fi
}

echo "🧪 Smoke testing: $ENDPOINT"
echo ""

check "GET /v1/models responds" "curl -sf $ENDPOINT/v1/models"
check "Models list is non-empty" "[ \$(curl -sf $ENDPOINT/v1/models | python3 -c 'import sys,json; print(len(json.load(sys.stdin).get(\"data\",[])))') -gt 0 ]"

echo ""
echo "Results: $PASS passed, $FAIL failed"

if [ "$FAIL" -gt 0 ]; then
  exit 1
fi
