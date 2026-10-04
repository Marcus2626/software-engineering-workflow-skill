#!/usr/bin/env bash
set -euo pipefail

# Run from a repository root.
ROOT="${1:-.}"
SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p \
  "$ROOT/.agent/exec-plans/active" \
  "$ROOT/.agent/exec-plans/completed" \
  "$ROOT/.agent/research" \
  "$ROOT/.agent/scratch" \
  "$ROOT/.agent/artifacts" \
  "$ROOT/.agent/screenshots"

if [[ ! -f "$ROOT/.agent/PLANS.md" ]]; then
  cp "$SKILL_DIR/references/PLANS.base.md" "$ROOT/.agent/PLANS.md"
  echo "Created $ROOT/.agent/PLANS.md"
else
  echo "Kept existing $ROOT/.agent/PLANS.md"
fi

if [[ ! -f "$ROOT/AGENTS.md" ]]; then
  {
    echo "# Repository Instructions"
    echo
    cat "$SKILL_DIR/assets/AGENTS.fragment.md"
  } > "$ROOT/AGENTS.md"
  echo "Created $ROOT/AGENTS.md"
else
  if ! grep -q "Complex engineering workflow" "$ROOT/AGENTS.md"; then
    {
      echo
      cat "$SKILL_DIR/assets/AGENTS.fragment.md"
    } >> "$ROOT/AGENTS.md"
    echo "Appended workflow section to $ROOT/AGENTS.md"
  else
    echo "AGENTS.md already contains workflow section"
  fi
fi

touch "$ROOT/.gitignore"
for pattern in ".agent/scratch/" ".agent/screenshots/"; do
  if ! grep -Fxq "$pattern" "$ROOT/.gitignore"; then
    echo "$pattern" >> "$ROOT/.gitignore"
  fi
done

echo
echo "Bootstrap complete."
echo "Next: have Codex inspect this repository and refine AGENTS.md + .agent/PLANS.md"
echo "with actual build/test/lint/typecheck/screenshot commands."
