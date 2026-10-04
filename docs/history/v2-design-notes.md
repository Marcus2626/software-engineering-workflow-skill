# v2 Design Notes

This historical note was preserved while consolidating the temporary v2
repository into the canonical Skill repository.

## Kept from v1 / OpenAI ExecPlan pattern

- `AGENTS.md` as durable repository guidance.
- `.agent/PLANS.md` as planning contract.
- One living, self-contained ExecPlan for long-running work.
- Progress, Discoveries, Decision Log and Outcomes as living sections.
- Scratch/research separation and resumability from repository state.

## Added in v2

- Risk-proportionate routing: QUICK / STANDARD / STRICT / EXPLORE.
- Bounded-task decomposition instead of broad phases.
- Main-thread critical-path rule for subagents.
- Read-only Explorer/Skeptic/Verifier roles.
- Explicit editing-worker ownership rules.
- Worktree/branch/PR guidance for parallel editing.
- Bug-fix Red-Green loop.
- Fresh-evidence-after-final-edit quality gate.
- Stronger independent-review resolution cycle.
- No mandatory user confirmation for routine planning decisions.

## Why it remained one Skill

For a personal workflow whose goal is “one request → end-to-end execution”, a
single orchestrator reduces invocation friction. Detailed procedures live in
references and are loaded only when needed. If the workflow grows substantially,
review, debugging and parallel-work procedures can become dedicated child Skills
while this Skill remains the router.
