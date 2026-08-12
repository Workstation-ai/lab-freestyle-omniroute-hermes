# Skill Design Specification

Read this file when creating or evaluating a skill.

## Core Principle

A skill solves one problem well. Reusability is the default. Specificity is the exception — and when it happens, it must be justified.

## The Reusability Test

Before creating a skill, ask:

1. **Is this a distinct ability?** Not "a thing I need to do" but "a capability that transfers across contexts."
2. **Does a generic version already exist?** If `sell` exists, don't create `sell-panchos` unless `sell-panchos` adds knowledge that `sell` doesn't have.
3. **Is the domain difference real?** Selling hotdogs vs selling software — different skills. Selling hotdogs vs selling — same skill, different invocation.

## Inheritance Pattern

When a specific skill builds on a generic one, it **extends**, not **duplicates**.

```
sell (generic)
├── scope: any sales interaction
├── knowledge: negotiation, pricing, closing
└── referenced by: sell-panchos

sell-panchos (specific)
├── scope: hotdog vending only
├── inherits: sell
├── adds: hotdog-specific inventory, condiment pairings, street vending regs
└── description: "Sell hotdogs. Extends sell with hotdog-specific knowledge."
```

### How to express inheritance

In the specific skill's SKILL.md:

```yaml
---
name: sell-panchos
description: >
  Sell hotdogs at street vendors. Extends the sell skill with
  hotdog-specific inventory, condiment pairing, and Argentine
  street vending regulations. Use ONLY when selling hotdogs specifically,
  not for general sales.
---
```

The body references the generic skill:

```markdown
## Base Skill

See [sell](../sell/SKILL.md) for negotiation, pricing, and closing techniques.

## Hotdog-Specific Knowledge

- Inventory: choripán, panchos argentinos, completos
- Condiments: chimichurri, salsa criolla, mostaza
- Regulations: municipal vending permits, food safety
```

### The rule

If a specific skill doesn't add anything to the generic, it's not a skill — it's an invocation. Don't create it.

## Scope in Description

The `description` field must clarify scope when the skill is domain-specific:

| Skill | Good description | Bad description |
|-------|-----------------|-----------------|
| `sell-panchos` | "Sell hotdogs. Extends sell with hotdog-specific..." | "Helps with selling" |
| `deploy-nextjs` | "Deploy Next.js apps to Vercel. Scope: Vercel only." | "Deploy web apps" |
| `hermes-config` | "Configure Hermes Agent for remote endpoints." | "Configure AI tools" |

**Test:** if the description could apply to anything, it's too vague.

## When NOT to create a skill

- It's a one-off task (use a script, not a skill)
- It's a subset of an existing skill (add it to the existing one)
- It's a preference, not a capability (use a convention record)
- It's a command, not knowledge (put it in AGENTS.md)

## Skill Lifecycle

1. **Generic skill exists** → use it
2. **Domain-specific need arises** → create specific skill that extends generic
3. **Generic skill doesn't exist yet** → create generic first, then specific
4. **Specific skill grows too large** → split into generic + specific

Don't skip step 3. Building specific without generic creates duplication.
