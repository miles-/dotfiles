#!/usr/bin/env bash

FOCUSED=$(aerospace list-workspaces --focused)
VISIBLE=$({ aerospace list-workspaces --monitor all --empty no; echo "$FOCUSED"; } | sort -u)

for sid in $(aerospace list-workspaces --all); do
    if echo "$VISIBLE" | grep -q "^${sid}$"; then
        color=0xffcdd6f4
        [ "$sid" = "$FOCUSED" ] && color=0xffcba6f7
        sketchybar --set space.$sid drawing=on label.color="$color"
    else
        sketchybar --set space.$sid drawing=off
    fi
done
