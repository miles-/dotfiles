#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
  LABEL="$INFO"
else
  # Every other sender, including the --update at bar start, carries no
  # payload, so resolve the frontmost application directly. lsappinfo needs no
  # Accessibility permission, unlike a System Events query.
  LABEL="$(lsappinfo info -only name "$(lsappinfo front)" | cut -d= -f2 | tr -d '"')"
fi

if [ -n "$LABEL" ]; then
  sketchybar --set "$NAME" label="$LABEL"
fi
