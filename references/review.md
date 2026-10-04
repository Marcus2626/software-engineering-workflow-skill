# Risk-Proportionate Review Protocol

Review against requested behavior, the active ExecPlan when present, the final diff,
affected tests/contracts/docs, and fresh validation evidence.

## Review levels

### QUICK
Focused self-check only. No independent reviewer by default.

### STANDARD
Main-agent final self-review is required. Add one independent reviewer only when
there is cross-cutting behavior, significant uncertainty, compatibility risk, or a
meaningful verification benefit.

### STRICT
Independent final review is required.

For a critical bounded task (for example auth, migration, public contract,
concurrency, destructive/external side effect), add a task-level verifier before
integration when the additional check materially reduces risk.

Do not mechanically run multiple reviewers on every task.

## Priority order
1. correctness / requested behavior;
2. regressions and compatibility;
3. security/auth/data exposure;
4. state, transactions, concurrency;
5. API/schema/interface drift;
6. error/failure paths;
7. missing edge cases/tests;
8. architecture boundary violations;
9. performance/resource risk when material;
10. stale docs/plan assumptions;
11. unrelated scope expansion.

## Finding format
Return only material findings, preferably:
- severity;
- location;
- problem;
- evidence;
- smallest reasonable fix direction;
- validation for the fix.

Avoid style commentary and broad re-summaries of the diff.

## Resolution
Every material finding must be fixed, disproven with evidence, or explicitly
accepted/deferred. Rerun affected checks after fixes.
