# Quality Gates and Evidence

## Fresh-evidence rule
Completion claims require evidence produced after the final relevant edit.

## Narrow first, broaden by risk
Prefer the narrowest credible check for each edit/milestone. Broaden when:
- shared contracts changed;
- impact is cross-cutting;
- focused checks expose uncertainty;
- route is STRICT;
- repository policy requires broader checks.

Examples:
- targeted unit/regression test;
- integration/API test;
- typecheck/lint/build;
- E2E/smoke test;
- migration dry-run/check;
- screenshot inspection;
- CI/PR checks.

Do not repeatedly run an expensive full suite without a new reason.

## Keep output compact
Capture pass/fail plus the smallest useful evidence. On failure, retain only relevant
error sections, commands, and paths in working context.

Store large logs/traces/reports under `.agent/artifacts/<task>/` (or scratch if
disposable) and reference the file instead of copying it into the ExecPlan/chat.

## When a preferred check cannot run
- record why;
- run the best repeatable substitute;
- do not claim full verification;
- state residual uncertainty.

## STRICT additions
Use relevant negative/failure-path validation, compatibility checks, and
rollback/recovery evidence.

## Final evidence record
Record compactly, for example:

`pytest tests/test_auth.py -q` — PASS (12 tests)

not a pasted full test transcript.
