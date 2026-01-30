#!/bin/bash

WALL_DIR="$HOME/.wallpapers"

CWD="$(pwd)"

cd "$WALL_DIR" || exit

IFS=$'\n'

SELECTED_WALL=$(for a in *.png; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -p "")

if [ -n "$SELECTED_WALL" ]; then
  ~/.config/scripts/theme-switcher.sh "$SELECTED_WALL"
fi

cd "$CWD" || exit
