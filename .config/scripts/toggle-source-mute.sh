#!/bin/bash

pactl set-source-mute @DEFAULT_SOURCE@ toggle

state=$(pactl get-source-mute @DEFAULT_SOURCE@)

if "$state" = "Mute: yes"; then
  notify-send "Microphone" "Microphone muted"
fi
