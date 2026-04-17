#!/usr/bin/env bash
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
if git rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git branch --show-current 2>/dev/null)
    status="$(basename "$cwd"):$branch"
else
    status="$(basename "$cwd")"
fi

model=$(echo "$input" | jq -r '.model.display_name // empty')
status="$status [$model]"

context_used=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)

status="$status [ctx: ${context_used}%]"

five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')

if [ -n "$five_pct" ]; then
  pct_fmt=$(printf '%.0f' "$five_pct")
  if [ -n "$five_reset" ]; then
    reset_fmt=$(date -d "@${five_reset}" +%H:%M 2>/dev/null || date -r "${five_reset}" +%H:%M 2>/dev/null)
    status="$status [5h: ${pct_fmt}%@${reset_fmt}]"
  else
    status="$status [5h: ${pct_fmt}%]"
  fi
fi

printf "%s" "$status"
