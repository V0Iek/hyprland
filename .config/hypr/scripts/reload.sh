#!/bin/bash

killall swaync

hyprpm reload

exec $HOME/.config/waybar/launch.sh &
swaync &

exec $HOME/.config/ags/launch.sh &
