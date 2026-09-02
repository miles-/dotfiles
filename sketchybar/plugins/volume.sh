#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script. Every other sender, including the
# --update at bar start, supplies nothing, so read the level directly.

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"
else
  VOLUME="$(osascript -e "output volume of (get volume settings)")"
fi

# macOS fires volume_change on a mute keypress too, but the payload carries no
# mute state, so read that separately. Without this the mute icon appears only
# when the level happens to be zero.
MUTED="$(osascript -e "output muted of (get volume settings)")"

if [ "$MUTED" = "true" ]; then
  ICON="󰖁"
else
  case "$VOLUME" in
    [6-9][0-9]|100) ICON="󰕾"
    ;;
    [3-5][0-9]) ICON="󰖀"
    ;;
    [1-9]|[1-2][0-9]) ICON="󰕿"
    ;;
    *) ICON="󰖁"
  esac
fi

sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%"
