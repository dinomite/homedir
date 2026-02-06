#!/bin/bash
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name // "unknown"')
CONTEXT_PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
COST=$(printf "%.2f" "$(echo "$input" | jq -r '.cost.total_cost_usd // 0')")

WORKTREE=$(basename "$(git rev-parse --show-toplevel 2>/dev/null)" 2>/dev/null || echo "n/a")
BRANCH=$(git branch --show-current 2>/dev/null || echo "n/a")

echo "$MODEL | ctx: ${CONTEXT_PCT}% | \$${COST} | ${WORKTREE} @ ${BRANCH}"
