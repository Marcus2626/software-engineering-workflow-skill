# Repository State Model

Use these destinations consistently.

| State type | Canonical location | Lifetime |
|---|---|---|
| Durable repo instructions | `AGENTS.md` | long-lived |
| Planning rules | `.agent/PLANS.md` | long-lived |
| Current complex-task state | `.agent/exec-plans/active/*.md` | task lifetime |
| Completed task history | `.agent/exec-plans/completed/*.md` | long-lived |
| Reusable research conclusions | `.agent/research/*.md` | as useful |
| Disposable experiments/logs/clones | `.agent/scratch/<task>/` | temporary |
| Validation/handoff evidence | `.agent/artifacts/` | task/project dependent |
| UI screenshots | `.agent/screenshots/<task>/` | usually temporary |
| Actual implementation | Git working tree/history | authoritative |

Rules:

1. Never rely on chat history for critical state.
2. Never keep a critical conclusion only in scratch.
3. Do not put task progress in `AGENTS.md`.
4. Do not let multiple subagents maintain conflicting canonical plans.
5. Reconcile the ExecPlan with Git before resuming interrupted work.
