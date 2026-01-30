#!/bin/bash

themes_dir=$HOME/.config/colorschemes

# Choose theme
theme=$(basename -a "$themes_dir"/*/ | rofi -dmenu -p "Choose theme" -no-show-icons)

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

# Rofi
ln -sf "$theme_path/rofi/colors.rasi" "$HOME/.config/rofi/shared/colors.rasi"

# Notification
notify-send "Theme" "Theme switched to $theme"
