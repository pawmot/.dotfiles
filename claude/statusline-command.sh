#!/usr/bin/env bash
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
status="[$(whoami)@$(hostname -s) $(basename "$cwd")]"

five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')

if [ -n "$five_pct" ]; then
  pct_fmt=$(printf '%.0f' "$five_pct")
  if [ -n "$five_reset" ]; then
    reset_fmt=$(date -d "@${five_reset}" +%H:%M 2>/dev/null || date -r "${five_reset}" +%H:%M 2>/dev/null)
    status="$status [5h: ${pct_fmt}% used, resets at ${reset_fmt}]"
  else
    status="$status [5h: ${pct_fmt}% used]"
  fi
fi

printf "%s" "$status"
