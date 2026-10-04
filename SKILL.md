---
name: software-engineering-workflow
description: >
  Orchestrate complex repository-backed software work with a living ExecPlan,
  risk-based validation, selective subagents, worktree isolation, and review.
  Use for multi-file features, refactors, migrations, uncertain debugging,
  long-running tasks, or work that may benefit from parallel agents.
---

# Software Engineering Workflow v3

This skill is a lightweight orchestrator. Keep durable repository facts in
`AGENTS.md`, planning rules in `.agent/PLANS.md`, and current task state in one
canonical ExecPlan.

Goal: progress complex software work end-to-end with minimal user prompting,
minimal repeated context, and enough evidence for safe continuation.

## 0. Instruction precedence

Follow explicit user instructions over this workflow unless they make the task
impossible or unsafe. Preserve mature repository instructions and conventions.

## 1. Canonical state

- `AGENTS.md` — durable repository rules/navigation.
- `.agent/PLANS.md` — repository planning contract.
- `.agent/exec-plans/active/<task>.md` — canonical complex-task state.
- Git working tree/history — canonical implementation state.
- `.agent/research/` — reusable findings.
- `.agent/scratch/` — disposable experiments/logs.
- `.agent/artifacts/` — retained evidence/reports.
- `.agent/screenshots/` — visual validation outputs.

Never create competing plans for the same task. Repository state wins over stale prose.

## 2. Route first; load only what the route needs

Read `references/routing.md`, classify the task, and use the lightest credible route:

- **QUICK** — local, reversible, low-risk.
- **STANDARD** — ordinary non-trivial behavior change.
- **STRICT** — high blast radius, difficult rollback, security/data/API/platform risk.
- **EXPLORE** — uncertainty dominates implementation.

Do not read every reference by default. Load a reference only when its procedure
is needed. QUICK work normally needs no ExecPlan and no reference documents.

## 3. Bootstrap or recover conservatively

For STANDARD/STRICT and long-running EXPLORE work, inspect only the evidence
needed to orient safely:

- relevant `AGENTS.md` files and `.agent/PLANS.md`;
- matching active ExecPlan, if any;
- nearby architecture/API/product docs;
- relevant implementation/tests and canonical commands;
- Git status/diff/branch state when material.

If workflow files are missing, use `references/bootstrap.md`. Do not overwrite
mature repository guidance.

If a matching ExecPlan exists, resume it. Reconcile it with Git/repository state
before continuing.

## 4. Resolve intent without routine confirmation loops

Establish the goal, material constraints/non-goals, and observable definition of
done from the request and repository.

Proceed with bounded, reversible assumptions. Ask only when an unresolved choice
materially changes product behavior, architecture, destructive data handling,
credentials/permissions, external side effects, or risk/cost.

## 5. Explore before planning when uncertainty is dominant

For EXPLORE work, define a learning goal and a bounded experiment before freezing
a design. Use `.agent/scratch/<task>/` for disposable work and
`.agent/research/<topic>.md` only for reusable conclusions.

For debugging, load `references/debugging.md`.

Promote only implementation-relevant conclusions into the ExecPlan. Do not copy
raw exploration transcripts into task state.

## 6. Maintain one compact living ExecPlan

For STANDARD/STRICT and long-running EXPLORE work, create or refresh:

`.agent/exec-plans/active/<short-task-name>.md`

using `references/execplan-template.md` and repository `.agent/PLANS.md`.

The plan should contain durable state, not a narrative of reasoning. Keep concise:

- purpose/scope;
- current behavior and constraints;
- design/contracts needed for execution;
- bounded task graph/ownership;
- progress;
- material discoveries/decisions;
- acceptance/validation;
- recovery/rollback when relevant.

Update it only when state materially changes, before a meaningful pause/handoff,
and at completion.

## 7. Decompose by outcomes and ownership

Each bounded task should define:

- one observable outcome;
- owner/write scope;
- dependencies;
- acceptance criteria;
- focused validation.

Prefer dependency graphs such as `contract -> backend + frontend -> integration`
over vague phases such as `backend -> frontend -> testing`.

Freeze shared interfaces before parallel editing.

## 8. Default to the main agent

Use subagents only when they provide meaningful **parallelism**, **context
isolation**, or **independent verification**. Do not delegate merely because work
can be decomposed.

Before delegation, load `references/subagents.md`.

The main agent owns the canonical ExecPlan, shared contracts, integration,
acceptance, and final handoff.

For parallel editing, load `references/parallel-pr.md` and use disjoint ownership,
preferably isolated branches/worktrees.

## 9. Implement and validate incrementally

For each bounded task:

1. implement only the intended slice;
2. add/update focused tests when appropriate;
3. run the narrowest credible relevant check;
4. inspect/fix failures;
5. rerun relevant validation after the final edit;
6. update compact task state only if materially changed.

Avoid unrelated refactors and repeated full-suite runs without risk justification.

For evidence policy, load `references/quality-gates.md`.

## 10. Visual work requires visual evidence

For material UI changes, use repeatable screenshot/E2E tooling when practical.
Store temporary captures under `.agent/screenshots/<task>/`, inspect them, fix
material defects, and regenerate after relevant edits.

DOM/test success alone does not establish visual correctness.

## 11. Review proportionally

Use `references/review.md`.

- QUICK: focused self-check only.
- STANDARD: main-agent self-review; use an independent reviewer when risk,
  cross-cutting behavior, or unresolved uncertainty justifies it.
- STRICT: independent final review is required. For critical bounded tasks, add a
  task-level verifier before integration when it materially reduces risk.

Review defects and verification gaps, not stylistic noise. Material findings must
be fixed, disproven with evidence, or explicitly accepted/deferred.

## 12. Checkpoint without writing a diary

Before a substantial pause, handoff, PR, or completion, ensure the ExecPlan records:

- current/next/blocked state;
- material discovery/decision changes;
- latest relevant validation;
- next concrete step if incomplete.

Do not duplicate large logs, raw tool output, or chat reasoning. Store large
artifacts under `.agent/artifacts/` and reference their paths.

## 13. Update AGENTS.md only for durable facts

Add only stable repository knowledge future agents need: canonical commands,
architecture boundaries, important docs, or required validation for a class of
changes. Never use `AGENTS.md` as a task diary.

## 14. Close and archive

A complex task is complete when requested behavior exists, final relevant evidence
is fresh, required review/visual checks are resolved, and residual uncertainty is
explicit.

Then:

1. finish Outcomes & Retrospective concisely;
2. record final validation/review evidence;
3. move the ExecPlan from `active/` to `completed/`;
4. clean/promote disposable scratch state.

## 15. Final handoff

Report only:

- what changed;
- what was verified and how;
- review status when applicable;
- remaining risks/follow-ups;
- archived ExecPlan path for complex work.

Do not restate the full plan or research history.
