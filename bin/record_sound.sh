#!/bin/bash

# To record desktop audio instead of mic:
# https://askubuntu.com/a/1051240/392897

recordingToggle="/tmp/ffmpeg-recording-audio"

if [[ "$1" == "-s" ]] && [[ -n "$2" ]]; then
  SLEEPS="$2"
fi

if [[ ! -f /tmp/ffmpeg-recording-audio ]]; then
  # Not recording
  audioFile=$(mktemp /tmp/ffmpeg-recording.XXXXXX.mp3)
  echo "$audioFile" > "$recordingToggle"

  if [[ -n "$SLEEPS" ]]; then
    echo "Recording in ${SLEEPS}s..."
    sleep "$SLEEPS"
  fi

  notify-send --hint=int:transient:1 -t 500 -u normal "録音しています..."
  # Record to mp3 and remove silence
  ffmpeg -f pulse -i default -ac 2 -af silenceremove=1:0:-50dB -acodec libmp3lame -ab 320k -y "$audioFile" 1>/dev/null
else
  # Already recording
  audioFile="$(cat "$recordingToggle")"

  echo "$audioFile"
  rm "$recordingToggle"

  killall -INT ffmpeg -s 2
  # Copy file path to clipboard in a way that allows the file to be
  # pasted in some GUI apps.
  echo -n "file://${audioFile}" | xclip -sel c -t text/uri-list

  notify-send --hint=int:transient:1 -t 500 -u normal "録音付けました"

  killall recordAudioToggle # Name of this script, TODO handle this better
fi
