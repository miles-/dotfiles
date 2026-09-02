#!/usr/bin/env sh

# Spotify posts com.spotify.client.PlaybackStateChanged on every play, pause and
# track change, so this item is event driven and needs no fast poll.

# Guard on the process list first. A tell block would launch Spotify if it is
# not already running.
if ! pgrep -x Spotify >/dev/null 2>&1; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

# One osascript call returns the state and the label. Spotify reports no artist
# for a podcast, so fall back to the album. An empty result means no track is
# loaded, so the item hides.
STATUS="$(osascript <<'OSA'
tell application "Spotify"
  set playerStatus to player state as text
  if playerStatus is not "playing" and playerStatus is not "paused" then return ""
  set trackName to name of current track
  set byLine to artist of current track
  if byLine is "" then set byLine to album of current track
  return playerStatus & "|" & trackName & " - " & byLine
end tell
OSA
)"

if [ -z "$STATUS" ]; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

STATE="${STATUS%%|*}"
LABEL="${STATUS#*|}"

# A paused track stays on the bar, dimmed to Catppuccin overlay0.
if [ "$STATE" = "playing" ]; then
  ICON_COLOR=0xff1db954
  LABEL_COLOR=0xffcdd6f4
else
  ICON_COLOR=0xff6c7086
  LABEL_COLOR=0xff6c7086
fi

sketchybar --set "$NAME" drawing=on \
           icon.color="$ICON_COLOR" \
           label.color="$LABEL_COLOR" \
           label="$LABEL"
