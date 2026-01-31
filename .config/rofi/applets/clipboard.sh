#!/bin/bash

 rofi_cmd() {
   rofi -dmenu \
     -display-columns 2 \
     -p "Clipboard" \
     -theme-str "listview { columns: 1; }"
 }

copied=$(cliphist list | rofi_cmd)

# Cancel if not chosen
[ -z "$copied" ] && exit 0

cliphist decode $copied | wl-copy
