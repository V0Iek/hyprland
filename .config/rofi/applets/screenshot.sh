#!/bin/bash

rofi_cmd() {
  rofi -dmenu \
    -no-show-icons \
    -theme-str "listview { columns: 3; lines: 1; }" \
    -theme-str "element-text { vertical-align: 0.5; horizontal-align: 0.5; }"
}

# Options
screen="󰍹  Screen"
window="󱂬  Window"
area="󰒉  Area"

# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | rofi_cmd)"
case $chosen in
    $screen)
  	sleep 0.4; grim -t png - | wl-copy -t image/png
        ;;
    $area)
		grim -g "$(slurp)" -t png - | wl-copy -t image/png
        ;;
    $window)
		sleep 0.4; grim -g "$(hyprctl activewindow | grep at: | cut -d' ' -f2) $(hyprctl activewindow | grep size: | cut -d' ' -f2 | sed 's/,/x/g')" - | wl-copy
        ;;
esac
