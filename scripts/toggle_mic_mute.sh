#!/usr/bin/env bash

# this assumes the mic you want muted is @DEFAULT_AUDIO_SOURCE@
# extracts name from alsa.card_name
mic_name=$(wpctl inspect @DEFAULT_AUDIO_SOURCE@ \
  | awk -F'= ' '/alsa.card_name/ {print $2}' \
  | tr -d '"')
mic_mute_status=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -o MUTED)

wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
if [[ -n "$mic_mute_status" ]]; then
    notify-send -t 3000 "Unmuted $mic_name"
else
    notify-send -t 3000 "Muted $mic_name"
fi
