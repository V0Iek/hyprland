#! /bin/bash

layout=$(printf "Pill\nIsland" | rofi -dmenu -p "Waybar layout" -no-show-icons -theme-str "listview {columns: 1;}")

# Cancel if not chosen
[ -z "$layout" ] && exit 0

exec ~/.config/waybar-themes/switchlayout.sh $layout
