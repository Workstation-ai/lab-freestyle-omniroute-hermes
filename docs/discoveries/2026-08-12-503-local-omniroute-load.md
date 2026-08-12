# Discovery: 503 Errors from Local OmniRoute Under Load

**Date:** 2026-08-12
**Severity:** warning

## What happened

Local OmniRoute instance returned `HTTP 503: Chat admission capacity is temporarily unavailable` after sustained usage with large contexts (~56K tokens).

## Root cause

Machine had 7.6GB RAM total, ~5.7GB used (Chrome eating ~3GB with many tabs), no GPU. OmniRoute backend couldn't handle the memory pressure from large context inference.

## Fix/Workaround

Deployed OmniRoute to Freestyle.sh VM with more resources. Local machines now point to remote endpoint.

## Prevention

- Pin specific models instead of `auto` routing for predictable resource usage
- Close unnecessary Chrome tabs to free RAM
- Monitor VM resource usage via Freestyle dashboard
