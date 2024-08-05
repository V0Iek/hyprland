#!/bin/sh

killall waybar
killall swaync

waybar &
swaync &
