## Complex engineering workflow

Use the `software-engineering-workflow` skill for significant features, refactors, migrations, cross-module changes, API/schema/auth/data changes, frontend+backend work, long-running tasks, or multi-agent work.

- Read `.agent/PLANS.md` for planning rules.
- Reuse a matching active ExecPlan; otherwise create one under `.agent/exec-plans/active/`.
- Use the lightest credible route: QUICK / STANDARD / STRICT / EXPLORE.
- Keep one canonical ExecPlan and keep it current.
- Validate bounded milestones before advancing; completion evidence must be fresh after the final edit.
- Use `.agent/scratch/` for disposable work and `.agent/research/` for durable research.
- Use subagents only for bounded, useful side work; keep the main thread on the critical path and integrate results centrally.
- Use isolated branches/worktrees for parallel editing and avoid overlapping write ownership.
- For material UI work, generate and inspect deterministic screenshots when practical.
- Perform independent review before completing STANDARD/STRICT work.
- Before stopping or handing off, checkpoint progress, discoveries, decisions, validation state, and the next concrete step.
- Do not ask the user for routine next-step confirmation when the plan already defines the next safe action.

Repository/Git state is authoritative over stale plan text.
