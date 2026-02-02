#!/bin/bash

killall swaync

hyprpm reload

exec $HOME/.config/waybar/launch.sh
swaync &
