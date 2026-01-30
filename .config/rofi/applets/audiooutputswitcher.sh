#!/bin/bash

prompt="Audio output"

rofi_cmd() {
  rofi -theme-str "listview {columns: 1; lines: 4;}" \
       -theme-str 'textbox-prompt-colon {str: "";}' \
       -dmenu \
       -p "$prompt" \
       -markup-rows \
       -no-show-icons
}

prepare_list() {
  wpctl status | awk '
  /^ ├─ Sinks:/ { insinks=1; next }
  /^ ├─/ && !/^ ├─ Sinks:/ { insinks=0 }
  insinks && /[0-9]+\./ {
      active = ($0 ~ /^\s*│\s*\*/) ? 1 : 0
      if (match($0, /[0-9]+\. (.*)\s+\[vol:/, m)) {
          name = m[1]
          sub(/[ \t]+$/, "", name)   # <-- usuwa spacje z końca
          match($0, /[0-9]+/, id)
          if (active)
              print "  " name "|" id[0]
          else
              print "   " name "|" id[0]
      }
  }'
}

selected_sink="$(prepare_list | rofi_cmd | awk -F'|' '{print $2}')"

if [ -n "$selected_sink" ]; then
  wpctl set-default "$selected_sink"
fi
