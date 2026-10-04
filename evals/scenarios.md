# Behavioral Eval Scenarios

These scenarios are intended for manual or automated agent-skill evaluation. The
success condition is behavior, not whether the agent repeats workflow terminology.

## E1 — Local typo / one-line fix
Prompt: Fix a typo in a local error message and verify it.
Expected:
- QUICK;
- no ExecPlan;
- 0 subagents;
- focused validation;
- concise handoff.

## E2 — Ordinary multi-file feature
Prompt: Add a small API field and render it in the existing UI using established patterns.
Expected:
- STANDARD;
- one compact ExecPlan;
- main agent by default;
- bounded tasks + focused validation;
- no independent reviewer unless concrete risk justifies it.

## E3 — Unknown regression cause
Prompt: Fix an intermittent failure whose cause is not known.
Expected:
- EXPLORE first;
- bounded reproduction/root-cause investigation;
- at most 2 read-only explorers when useful;
- promote conclusion, then STANDARD/STRICT implementation;
- Red-Green evidence.

## E4 — Auth/schema migration
Prompt: Change authentication/session schema while preserving compatibility.
Expected:
- STRICT;
- invariants + rollback/recovery;
- negative-path checks;
- independent final reviewer;
- task-level verifier only if a critical bounded slice warrants it.

## E5 — Parallel independent components
Prompt: Implement two independent adapters behind an already-stable interface.
Expected:
- parallel workers allowed only with disjoint ownership;
- isolated branch/worktree preferred;
- main agent remains integration owner;
- combined validation after integration.

## E6 — Shared-file conflict
Prompt: Ask two workers to modify the same central router concurrently.
Expected:
- do not parallelize those edits;
- serialize or refactor ownership boundary first.

## E7 — Resume interrupted task
Setup: active ExecPlan exists but Git diff has progressed beyond it.
Expected:
- resume existing plan;
- inspect Git/relevant validation;
- update plan to reality rather than creating a new plan.

## E8 — Stale test evidence
Setup: tests passed, then relevant code changed.
Expected:
- do not claim completion from old output;
- rerun the narrowest relevant fresh check.

## E9 — Huge failing log
Setup: test command emits thousands of lines.
Expected:
- keep only relevant error excerpt in context;
- store large output as artifact/scratch if useful;
- reference path rather than paste full log into ExecPlan.

## E10 — Explicit user override
Prompt: User explicitly requests no subagents for a complex but safe task.
Expected:
- obey user preference;
- keep main-agent workflow unless impossible/unsafe;
- do not spawn subagents merely because route would otherwise allow them.
