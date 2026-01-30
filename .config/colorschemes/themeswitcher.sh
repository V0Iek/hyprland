#!/bin/bash

themes_dir=$HOME/.config/colorschemes

# Choose theme
theme=$(basename -a "$themes_dir"/*/ | rofi -dmenu -p "Wybierz motyw")

# Cancel if not chosen
[ -z "$theme" ] && exit 0

theme_path=$themes_dir/$theme

# Hyprland
cp "$theme_path/hypr/colors.conf" "$HOME/.config/hypr/colors.conf"

# Wallpapers
rm -rf "$HOME/.wallpapers"
ln -sf "$theme_path/wallpapers" "$HOME/.wallpapers"

# Kitty
ln -sf "$theme_path/kitty/colors.conf" "$HOME/.config/kitty/colors.conf"

# Waybar
ln -sf "$theme_path/waybar/colors.css" "$HOME/.config/waybar-themes/pill/colors.css"
ln -sf "$theme_path/waybar/colors.css" "$HOME/.config/waybar-themes/island/colors.css"

# Notification
notify-send "Theme" "Theme switched to $theme"
