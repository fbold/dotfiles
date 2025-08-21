#!/bin/bash

tooltip=$(trackie report \
  | tail -n +2 \
  | tr -d '\r' \
  | sed 's/ ❯ //' \
  | sed 's/^[[:space:]]*//' \
  | sed 's/[[:cntrl:]]//g; s/[[:space:]]\+/ /g' \
  | paste -sd '\n' -)

if output=$(trackie status --format "[%p %D]" 2>/dev/null); then
  status="$output"
else
  status="[not tracking]"
fi

jq -n --compact-output --arg t "$tooltip" --arg s "$status" '{text:$s, tooltip:$t}'
