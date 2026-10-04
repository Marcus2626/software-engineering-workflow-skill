# Parallel Work, Worktrees, and PR Boundaries

Use parallel editing only after shared contracts are stable.

## Before parallel work
- define task graph;
- freeze interfaces needed by multiple workers;
- assign file/module ownership;
- identify integration order;
- define validation for each branch;
- choose a merge/integration owner.

## Isolation
Prefer separate Git branches/worktrees for editing workers. Do not allow two workers to modify the same core files concurrently.

Read-only exploration/review agents do not require worktrees unless tooling forces it.

## PR sizing
A good PR delivers one coherent outcome and remains reviewable. Avoid unrelated cleanup, mass formatting, dependency churn, and opportunistic refactors.

If the overall task is large, encode staged PR boundaries in the ExecPlan, for example:
1. contract/model groundwork;
2. backend behavior;
3. frontend integration;
4. cleanup/docs only if needed.

Each PR should carry its own tests/evidence and preserve a working integration path.

## Integration
The main agent/integration owner:
- reviews each worker diff;
- resolves interface drift;
- runs combined validation;
- updates the canonical ExecPlan;
- triggers independent review on the integrated result.
