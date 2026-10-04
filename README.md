# Software Engineering Workflow Skill for Codex

`software-engineering-workflow-skill` is a reusable Codex Skill for
repository-backed software development. It provides risk routing, compact
living ExecPlans, selective multi-agent delegation, worktree isolation, fresh
evidence, and proportional review.

> This is the single canonical repository for the Skill. Versions belong in
> Git tags and GitHub Releases, not in separate `-v2` or `-v3` repositories.

## Versioning and development

- `main` is the current stable development line.
- Use a short-lived feature branch and pull request for a material change.
- Validate changes with `bash scripts/verify-skill.sh` before merging.
- Mark published versions with annotated tags such as `v3.0.0`, then create a
  GitHub Release from that tag.
- Keep the installed folder name as `software-engineering-workflow`, which is
  the Skill name used by Codex.

## Current release: v3.0.0

v3 preserves the v2 engineering model while reducing repeated context:

- QUICK loads almost nothing and uses no subagents by default;
- STANDARD defaults to one main agent and compact self-review;
- EXPLORE uses at most a small number of read-only explorers;
- STRICT uses the minimum editing workers needed plus independent review;
- references are loaded only when their procedure is needed;
- subagents receive narrow context packets instead of rediscovering the repo;
- ExecPlans store durable state, not reasoning transcripts;
- large logs go to artifacts instead of chat/plan context;
- expensive validation/review is risk-proportionate;
- behavior-eval scenarios are included under `evals/`.

## Install

User-scoped:

```bash
mkdir -p ~/.agents/skills
cp -R software-engineering-workflow-skill ~/.agents/skills/software-engineering-workflow
```

Repo-scoped:

```bash
mkdir -p .agents/skills
cp -R software-engineering-workflow-skill .agents/skills/software-engineering-workflow
```

Restart/reload Codex after updating the skill if your client requires it.

## First use in a repository

Ask once:

```text
Use the software-engineering-workflow skill to bootstrap this repository. Inspect
it first, preserve existing conventions, initialize only missing planning
infrastructure, and refine AGENTS.md plus .agent/PLANS.md using commands and
architecture you can actually verify.
```

Or run:

```bash
bash scripts/init-workflow.sh /path/to/repo
```

## Normal use

Usually just give the engineering request:

```text
Implement OAuth login with refresh-token rotation.
```

For deterministic invocation:

```text
Use the software-engineering-workflow skill for this task.
```

## Routing summary

```text
QUICK    -> main only, focused edit/check
STANDARD -> main by default, compact ExecPlan, optional 1 useful side agent
EXPLORE  -> bounded investigation, up to 2 read-only explorers
STRICT   -> minimum workers, stronger evidence, independent reviewer
```

## State model

```text
AGENTS.md                     durable repo rules
.agent/PLANS.md               planning contract
.agent/exec-plans/active/     current task state
.agent/exec-plans/completed/  task history
.agent/research/              reusable findings
.agent/scratch/               disposable experiments/logs
.agent/artifacts/             retained evidence/reports
.agent/screenshots/           visual validation
Git                           canonical implementation state
```

See `V3-NOTES.md`, `references/`, and `evals/scenarios.md`.
