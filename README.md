# software-engineering-workflow v3

A token-optimized Codex orchestrator for repository-backed software development:
risk routing, compact living ExecPlans, selective multi-agent delegation,
worktree isolation, fresh evidence, and proportional review.

## What changed in v3

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
cp -R software-engineering-workflow-v3 ~/.agents/skills/software-engineering-workflow
```

Repo-scoped:

```bash
mkdir -p .agents/skills
cp -R software-engineering-workflow-v3 .agents/skills/software-engineering-workflow
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
