# Decision: Remote OmniRoute Gateway on Freestyle.sh

**Date:** 2026-08-12
**Status:** accepted

## Context

Local OmniRoute instances cause 503 errors when the host machine has limited resources (7.6GB RAM, no GPU). Each machine requires its own installation and configuration.

## Decision

Deploy OmniRoute as a centralized remote gateway on a Freestyle.sh VM. All local machines (Hermes, OpenCode) connect to this single endpoint.

## Alternatives Considered

- **Keep OmniRoute local** — rejected because resource constraints cause 503s under load
- **Use cloud provider (AWS/GCP)** — rejected because Freestyle has simpler lifecycle management and VM-level primitives (SSH, PTY, domains) out of the box
- **Self-host on bare metal** — rejected because Freestyle handles restarts, snapshots, and networking

## Consequences

- One gateway serves the entire team
- Local machines need zero OmniRoute installation
- VM resource limits (CPU/RAM) are Freestyle's responsibility
- Endpoint URL becomes the single configuration point per machine
- Network latency adds ~50-200ms per request (acceptable for LLM calls)
