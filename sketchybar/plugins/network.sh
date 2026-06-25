#!/usr/bin/env sh

# Interface backing the current default route (the connection actually in use)
DEFAULT_IF=$(route -n get default 2>/dev/null | awk '/interface:/{print $2}')

# Hardware port name for Wi-Fi (usually en0, but resolve it to be safe)
WIFI_IF=$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}')

if [ -z "$DEFAULT_IF" ]; then
    ICON="󰤭"        # wifi off
    LABEL="Offline"
elif [ "$DEFAULT_IF" = "$WIFI_IF" ]; then
    # The SSID is masked by endpoint security tooling on this managed Mac,
    # so just show the connection type rather than the network name.
    ICON="󰖩"        # wifi
    LABEL="Wi-Fi"
else
    ICON="󰈁"        # ethernet
    LABEL="Ethernet"
fi

sketchybar --set "$NAME" icon="$ICON" label="$LABEL"
