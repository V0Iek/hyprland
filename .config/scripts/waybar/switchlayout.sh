#! /bin/bash

rm ~/.config/waybar

case "$1" in
  "Pill") ln -sf ~/.config/waybar-themes/pill ~/.config/waybar ;;
  "Island") ln -sf ~/.config/waybar-themes/island ~/.config/waybar ;;
esac

exec ~/.config/waybar/launch.sh
