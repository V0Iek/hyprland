#!/bin/bash

WALL_DIR="$HOME/.wallpapers"

CWD="$(pwd)"

cd "$WALL_DIR" || exit

IFS=$'\n'

rofi_cmd() {
  rofi -show-icons \
    -dmenu \
    -p "Wallpaper" \
    -theme-str "
      listview { columns: 4; lines: 3; }
      element { orientation: vertical; padding: 5px; }
      element-icon { size: 150px; vertical-align: 0.5; horizontal-align: 0.5; }
      element-text { horizontal-align: 0.5; }
    "
}

SELECTED_WALL=$(for a in *.png; do echo -en "$a\0icon\x1f$a\n" ; done | rofi_cmd)

if [ -n "$SELECTED_WALL" ]; then
  ~/.config/scripts/theme-switcher.sh "$SELECTED_WALL"
fi

cd "$CWD" || exit
