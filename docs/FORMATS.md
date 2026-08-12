# Record Formats

Read this file only when writing a decision, discovery, or convention record.

## Decision

```markdown
# Decision: <title>

**Date:** YYYY-MM-DD
**Status:** proposed | accepted | superseded

## Context
<why this decision was needed>

## Decision
<what was decided>

## Alternatives
- <option A> — rejected because <reason>
- <option B> — rejected because <reason>

## Consequences
<what this means for the project>
```

## Discovery

```markdown
# Discovery: <title>

**Date:** YYYY-MM-DD
**Severity:** critical | warning | info

## What happened
<description>

## Root cause
<why it happened>

## Fix
<how to handle it>

## Prevention
<how to avoid it next time>
```

## Convention

```markdown
# Convention: <title>

**Date:** YYYY-MM-DD
**Scope:** <what this applies to>

## Pattern
<the convention itself>

## Rationale
<why this is better than alternatives>
```
