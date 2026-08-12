# Troubleshooting

## Common Issues

### OmniRoute won't start

**Symptom:** Container exits immediately after start

**Check:**
```bash
freestyle vm exec omniroute-gw "docker logs omniroute"
```

**Fix:** Usually a port conflict. Ensure port 20128 is free:
```bash
freestyle vm exec omniroute-gw "ss -tlnp | grep :20128"
```

### 503 Chat admission capacity unavailable

**Symptom:** Requests return HTTP 503 with "Chat admission capacity is temporarily unavailable"

**Cause:** OmniRoute backend is overloaded or a provider is temporarily down

**Fix:**
1. Wait 30-60 seconds and retry
2. If persistent, restart OmniRoute:
   ```bash
   freestyle vm exec omniroute-gw "docker restart omniroute"
   ```
3. Consider pinning a specific model instead of `auto`

### 401 Unauthorized errors

**Symptom:** Requests return 401 from OmniRoute

**Cause:** Using plain `auto` routing which hits broken free tiers

**Fix:** Switch to `auto/best-coding` or `auto/best-chat` — these use combo models that evaluate multiple providers

### Connection refused from local machine

**Symptom:** Can't reach the Freestyle VM endpoint

**Check:**
1. Verify VM is running: `freestyle vm status omniroute-gw`
2. Verify port is exposed: `curl http://<vm-ip>:20128/v1/models`
3. Check firewall rules on Freestyle

### High latency

**Symptom:** Requests take >10 seconds

**Cause:** OmniRoute is routing to a slow provider

**Fix:** Pin a fast model like `google/gemini-2.5-flash`

## Getting Help

1. Check OmniRoute logs: `freestyle vm exec omniroute-gw "docker logs omniroute --tail 100"`
2. Test endpoint: `./scripts/smoke-test.sh <endpoint-url>`
3. Verify models: `curl <endpoint-url>/v1/models`
