#!/usr/bin/env bash

# A single hidden item owns this script, and every workspace item is updated in
# one sketchybar call. Attaching the script to each workspace item instead made
# one workspace change run this whole loop once per workspace.

ALL=$(aerospace list-workspaces --all) || exit 0
[ -n "$ALL" ] || exit 0

# The aerospace_workspace_change trigger carries the focused workspace, so only
# ask the CLI when this script runs from another sender.
FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"
NON_EMPTY=$(aerospace list-workspaces --monitor all --empty no)

args=()
for sid in $ALL; do
    if [ "$sid" = "$FOCUSED" ]; then
        args+=(--set "space.$sid" drawing=on label.color=0xffcba6f7)
    elif grep -qx -- "$sid" <<<"$NON_EMPTY"; then
        args+=(--set "space.$sid" drawing=on label.color=0xffcdd6f4)
    else
        args+=(--set "space.$sid" drawing=off)
    fi
done

sketchybar "${args[@]}"
