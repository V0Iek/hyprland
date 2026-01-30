#!/bin/bash

source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

WALL_DIR="$HOME/.wallpapers"

mesg="Available Wallpapers: `find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.jpeg" \) | wc -l`"

rofi_cmd() {
  rofi -show-icons \
    -dmenu \
    -p "Wallpaper" \
    -mesg "$mesg" \
    -markup-rows \
    -theme ${theme} \
    -theme-str '
      listview {
        columns: 4;
        lines: 3;
        spacing: 12px;
        fixed-height: false;
      }

      element {
        orientation: vertical;
        padding: 10px;
        background-color: transparent;
        border: 0px;
      }

      element normal {
        background-color: transparent;
      }

      element selected {
        background-color: rgba(255,255,255,0.08);
        border-radius: 14px;
      }

      element-icon {
        size: 150px;
        horizontal-align: 0.5;
        vertical-align: 0.5;
        background-color: transparent;
      }

      element-text {
        enabled: true;
        text-color: transparent;
      }

      textbox-prompt-colon {
        str: "";
      }
  '
}

CWD="$(pwd)"

cd "$WALL_DIR" || exit

IFS=$'\n'

SELECTED_WALL=$(
  for a in *.png *.jpg *.jpeg *.webp; do
    [ -e "$a" ] || continue
    echo -en "$a\0icon\x1f$WALL_DIR/$a\n"
  done | rofi_cmd
)

if [ -n "$SELECTED_WALL" ]; then
    ~/.config/scripts/theme-switcher.sh "$WALL_DIR/$SELECTED_WALL"
fi

cd "$CWD" || exit
