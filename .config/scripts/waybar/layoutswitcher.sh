#! /bin/bash

option=$(printf "Pill\nIsland" | rofi -dmenu -p "Waybar layout" -p -theme ~/.config/rofi/launchers/type-2/style-2 -theme-str "listview {columns: 1;}")

exec ~/.config/scripts/waybar/switchlayout.sh $option
