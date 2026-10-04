# v3 Design Notes — Token-Optimized Orchestration

v3 keeps the v2 repository-backed engineering model but optimizes for useful work
per token rather than maximum process.

## Main changes

1. **Progressive disclosure** — the main `SKILL.md` is shorter and references are
   loaded only by route/need.
2. **Main-agent default** — decomposition no longer implies delegation.
3. **Agent budgets** — QUICK=0; STANDARD=0 by default; EXPLORE<=2 read-only;
   STRICT uses the minimum needed, normally <=2 concurrent editors + 1 reviewer.
4. **Narrow delegation packets** — pass known files/contracts so side agents do not
   repeatedly rediscover repository context.
5. **Compact state** — ExecPlans contain durable decisions/progress/evidence, not
   reasoning narratives or pasted logs.
6. **Risk-proportionate review** — STANDARD self-review by default; STRICT
   independent review; task-level verification only where it materially reduces risk.
7. **Narrow-first validation** — broaden checks when blast radius/risk demands it,
   while still requiring fresh evidence after final edits.
8. **Large-output hygiene** — logs/traces live in artifacts/scratch, with concise
   references in context.
9. **Behavior evals** — scenarios define expected routing/delegation/recovery
   behavior so future changes can be evaluated rather than justified only by prose.

## What did not change

- one canonical ExecPlan;
- repository state beats stale plan prose;
- stable interfaces before parallel editing;
- worktree/branch isolation for editing workers;
- deterministic UI evidence when material;
- checkpoint before meaningful handoff;
- final archive and cleanup.

## Design target

The desired behavior is:

```text
small task      -> almost no workflow overhead
normal task     -> one capable main agent
uncertain task  -> focused exploration, then implementation
high-risk task  -> bounded multi-agent help + stronger independent evidence
```
