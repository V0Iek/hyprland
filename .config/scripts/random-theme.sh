#!/bin/sh

wallpaper_dir="$HOME/.Wallpapers"
wallpapers=("$wallpaper_dir"/*)

random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

~/.config/scripts/theme-switcher.sh "$random_wallpaper"
