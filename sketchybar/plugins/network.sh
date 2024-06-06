#!/usr/bin/env sh

# Get Wi-Fi network information
WI_FI_INFO=$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}')

# Get the current Wi-Fi network
CURRENT_NETWORK=$(echo "$WI_FI_INFO" | xargs networksetup -getairportnetwork | sed "s/Current Wi-Fi Network: //")

# Check if the current network is associated with an airport network
if echo "$CURRENT_NETWORK" | grep -q "You are not associated with an AirPort network"; then
    LABEL="N/A"
    sketchybar --set net_logo background.color=0xff3C3E4F --set net label.color=0xff1e1d2e
else
    sketchybar --set net_logo background.color=0xffE0A3AD --set net label.color=0xffECEFF4 
    LABEL=$(echo "$CURRENT_NETWORK")
fi

sketchybar --set "$NAME" label="$LABEL"
