# Execution Plan Standard

An ExecPlan is a compact living implementation document for complex work. A fresh
agent should be able to continue using the working tree, repository instructions,
and the active ExecPlan without prior chat history.

## When required
Use an ExecPlan for STANDARD/STRICT work and long-running EXPLORE work. Do not
require one for trivial/local QUICK changes.

## Required properties
Every ExecPlan must be:
- self-contained enough to resume;
- repository-specific;
- based on observable outcomes;
- continuously corrected when reality changes;
- explicit about validation;
- concise: durable state, not reasoning transcript.

## Required structure
Contain directly or equivalently:
- Purpose / Big Picture;
- Scope / Non-Goals;
- Repository Context / Current Behavior;
- Constraints / Invariants;
- Proposed Design / stable contracts when needed;
- Task Graph / Ownership;
- Progress;
- Surprises & Discoveries;
- Decision Log;
- Validation & Acceptance;
- Idempotence / Recovery / Rollback when relevant;
- Artifacts / Evidence references;
- Outcomes & Retrospective.

## Compact living sections

### Progress
Use checkboxes/status. Record actual state only: done, current, next, blocked.

### Surprises & Discoveries
Record only unexpected facts that affect implementation, risk, or validation.
Prefer one-line finding + evidence path/command.

### Decision Log
Record only material decisions and concise rationale. Do not narrate alternatives
unless they matter to future continuation.

### Outcomes & Retrospective
At completion record delivered behavior, fresh validation, material deviations,
residual risks, and follow-up.

## Bounded tasks
Each milestone/task should define:
- observable objective;
- expected code/write ownership;
- dependencies;
- acceptance criteria;
- focused validation.

Avoid vague phases such as "implement backend".

## Research
Use `.agent/scratch/` for disposable work and `.agent/research/` for reusable
conclusions. Promote only implementation-relevant conclusions to the ExecPlan.

## Validation
Validation is part of implementation. Use fresh evidence after the final relevant
edit. Store large logs/artifacts outside the plan and reference their paths.

## Recovery
For destructive/stateful/irreversible steps, explain safe rerun, partial-failure
recovery, rollback, and state that must be preserved.

## Handoff
Before stopping, make current/next/blocked state and latest relevant validation
obvious. Do not duplicate chat history.

## Route-specific requirements
Record STANDARD, STRICT, or EXPLORE.

STRICT must cover relevant compatibility/security/data/rollback risks and requires
independent final review.

EXPLORE must state the learning goal/evidence needed before implementation.

## Subagents
There is one canonical ExecPlan. Workers do not create competing plans. Editing
subagents require stable interfaces and disjoint ownership.
