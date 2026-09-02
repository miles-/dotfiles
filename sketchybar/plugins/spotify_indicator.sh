#!/usr/bin/env sh

# Spotify posts com.spotify.client.PlaybackStateChanged on every play, pause and
# track change, so this item is event driven and needs no fast poll.

# Guard on the process list first. A tell block would launch Spotify if it is
# not already running.
if ! pgrep -x Spotify >/dev/null 2>&1; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

# One osascript call returns the whole label. Spotify reports no artist for a
# podcast, so fall back to the album, as the previous script did.
TRACK="$(osascript <<'OSA'
tell application "Spotify"
  if player state is not playing then return ""
  set trackName to name of current track
  set byLine to artist of current track
  if byLine is "" then set byLine to album of current track
  return trackName & " - " & byLine
end tell
OSA
)"

if [ -z "$TRACK" ]; then
  sketchybar --set "$NAME" drawing=off
else
  sketchybar --set "$NAME" drawing=on label="$TRACK"
fi
