#!/bin/bash

killall swaync

exec $HOME/.config/waybar/launch.sh
swaync &
