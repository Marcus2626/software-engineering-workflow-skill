# Token-Efficient Subagent Supervision

The goal is not more agents. Delegate only when expected value from parallelism,
context isolation, or independent verification exceeds coordination/context cost.

## Main-agent ownership
The main agent owns:
- canonical ExecPlan;
- shared interfaces/contracts;
- integration;
- acceptance decisions;
- final validation/handoff.

## Preferred roles

### Explorer / Searcher (read-only)
Use for code mapping, call-chain tracing, locating tests, dependency semantics, or
legacy behavior.

Return only:
- finding;
- evidence (`path:symbol`, command, doc, or reproduction);
- implication;
- unresolved uncertainty, if any.

Do not summarize unrelated repository context.

### Skeptic / Risk reviewer (read-only)
Challenge a bounded design/assumption. Report concrete failure modes and evidence,
not a replacement architecture unless necessary.

### Worker (editing)
Use only for a bounded outcome with stable contracts and disjoint write ownership.

### Verifier / Reviewer (prefer read-only)
Independently check a bounded implementation or integrated diff. Reproduce suspected
defects when practical.

## Do not delegate when
- the next main-thread step is immediately blocked on the result and no useful
  parallel work exists;
- the subtask is tightly coupled to the edit in progress;
- write boundaries are ambiguous;
- agents would touch the same core files;
- the task is small enough that delegation duplicates repo reading;
- coordination cost likely exceeds benefit.

## Delegation packet
Do not ask a subagent to "inspect the repo and do X" unless broad inspection is the
actual task. Pass the smallest useful context:

1. active ExecPlan path;
2. concrete goal;
3. relevant files/symbols already known;
4. allowed write scope;
5. forbidden/owned-by-others areas;
6. stable contracts/assumptions;
7. expected concise output;
8. acceptance/evidence criteria.

Subagents should inspect outside this scope only when necessary and should explain why.

## Reconciliation
Treat subagent output as a proposal/report. The main agent verifies material claims,
integrates deliberately, and promotes only durable conclusions into the ExecPlan.

Avoid worker-specific competing plans. Store useful larger reports under
`.agent/artifacts/<task>/` rather than copying them into the ExecPlan.
