# Risk-Proportionate Routing and Context Budget

Choose the lightest workflow that credibly protects the outcome. Route by blast
radius, reversibility, uncertainty, and interface/data/security risk—not file count.

## QUICK
Use for small, local, reversible edits with known callers and obvious validation.

Default budget:
- 0 subagents;
- no ExecPlan;
- no reference reads unless a specific procedure is required;
- focused validation only.

Escalate when broader coupling or risk appears.

## STANDARD
Use for ordinary non-trivial behavior changes, multi-file features, or bounded
refactors.

Default budget:
- main agent only;
- 0 subagents by default;
- at most 1 explorer or reviewer unless clear parallel value exists;
- one compact living ExecPlan;
- focused milestone validation;
- main-agent final self-review.

Use an independent reviewer only when cross-cutting behavior, uncertainty, or risk
makes the extra context worthwhile.

## STRICT
Use when failure cost/blast radius is high, including auth/security/permissions,
public APIs/schemas, persistent data migrations, production/deployment,
dependency/platform changes, destructive actions, billing/messaging/infrastructure,
or privacy-sensitive handling.

Default budget:
- minimum agent count needed;
- prefer <=2 concurrent editing workers;
- 1 independent final reviewer required;
- add a task-level verifier only for critical/high-risk bounded tasks;
- explicit invariants, rollback/recovery, negative-path checks, residual risk.

## EXPLORE
Use when uncertainty dominates implementation.

Default budget:
- main agent plus up to 2 read-only explorers when independent investigation helps;
- bounded learning goal/experiment;
- no editing worker until a design/contract is stable;
- convert to STANDARD or STRICT once implementation is justified.

## Reference loading matrix

Load only what is needed:

- QUICK: normally none.
- STANDARD: `.agent/PLANS.md`; `quality-gates.md` when validation policy matters;
  `subagents.md` only if delegating; `review.md` only for independent review.
- STRICT: `.agent/PLANS.md`, `quality-gates.md`, `review.md`; `subagents.md` and
  `parallel-pr.md` only if multi-agent editing is used.
- EXPLORE: `debugging.md` for bugs; `subagents.md` only when using explorers.
- Bootstrap: `bootstrap.md` only when workflow infrastructure is missing.

Do not preload references for possible future use.

## Escalation triggers
Escalate when discovering shared interfaces, stateful/destructive behavior,
security/data implications, unclear rollback, production effects, or unexpectedly
broad coupling.
