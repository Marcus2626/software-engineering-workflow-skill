#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
required=(
  SKILL.md README.md V3-NOTES.md evals/scenarios.md
  references/PLANS.base.md references/execplan-template.md
  references/bootstrap.md references/review.md references/repository-state-model.md
  references/routing.md references/subagents.md references/parallel-pr.md
  references/quality-gates.md references/debugging.md
  assets/AGENTS.fragment.md assets/gitignore.fragment
  scripts/init-workflow.sh scripts/verify-skill.sh
)
for f in "${required[@]}"; do
  [[ -f "$ROOT/$f" ]] || { echo "Missing: $f" >&2; exit 1; }
done

grep -q '^name: software-engineering-workflow$' "$ROOT/SKILL.md"
grep -q '^description:' "$ROOT/SKILL.md"
grep -q '^# Software Engineering Workflow v3$' "$ROOT/SKILL.md"
grep -q 'Default budget:' "$ROOT/references/routing.md"
grep -q 'Do not preload references' "$ROOT/references/routing.md"
grep -q 'Fresh-evidence rule' "$ROOT/references/quality-gates.md"
grep -q 'E10 — Explicit user override' "$ROOT/evals/scenarios.md"

bash -n "$ROOT/scripts/init-workflow.sh"
bash -n "$ROOT/scripts/verify-skill.sh"

echo "Skill package structure and v3 policy checks: OK"
