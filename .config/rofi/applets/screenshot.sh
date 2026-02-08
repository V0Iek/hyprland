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
  	  sleep 0.4; hyprshot -m output -m active
        ;;
    $area)
		hyprshot -m region
        ;;
    $window)
      sleep 0.4; hyprshot -m window
        ;;
esac
