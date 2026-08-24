#!/bin/bash

themes_dir=$HOME/.config/colorschemes

# Choose theme
theme=$(basename -a "$themes_dir"/*/ | rofi -dmenu -p "Choose theme" -no-show-icons)

# Cancel if not chosen
[ -z "$theme" ] && exit 0

theme_path=$themes_dir/$theme

# Hyprland
cp "$theme_path/hypr/colors.lua" "$HOME/.config/hypr/colors.lua"

# Wallpapers
rm -rf "$HOME/.wallpapers"
ln -sf "$theme_path/wallpapers" "$HOME/.wallpapers"

# Kitty
ln -sf "$theme_path/kitty/colors.conf" "$HOME/.config/kitty/colors.conf"

# Waybar
ln -sf "$theme_path/waybar/colors.css" "$HOME/.config/waybar-themes/pill/colors.css"
ln -sf "$theme_path/waybar/colors.css" "$HOME/.config/waybar-themes/island/colors.css"

# Quickshell
ln -sf "$theme_path/quickshell/colors.qml" "$HOME/.config/quickshell/Colors.qml"

# Rofi
ln -sf "$theme_path/rofi/colors.rasi" "$HOME/.config/rofi/shared/colors.rasi"

# Swaync
ln -sf "$theme_path/swaync/colors.css" "$HOME/.config/swaync/colors.css"

# Vesktop
ln -sf "$theme_path/vesktop/colors.css" "$HOME/.var/app/dev.vencord.Vesktop/config/vesktop/themes/colors.css"

# Reload & set Wallpaper
exec "$HOME/.config/hypr/scripts/reload.sh" &
exec "$HOME/.config/quickshell/reload.sh"
exec "$HOME/.config/scripts/random-theme.sh"

# Notification
notify-send "Theme" "Theme switched to $theme"
