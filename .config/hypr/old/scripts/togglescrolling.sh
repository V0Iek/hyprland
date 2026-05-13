#!/bin/bash

current_layout=$(hyprctl getoption general:layout | grep -oE '(dwindle|scrolling)')

if [ "$current_layout" = "scrolling" ]; then
  hyprctl keyword general:layout dwindle
else
  hyprctl keyword general:layout scrolling
fi
