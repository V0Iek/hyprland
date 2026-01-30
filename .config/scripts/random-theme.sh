#!/bin/bash

wallpaper_dir="$HOME/.wallpapers"
wallpapers=("$wallpaper_dir"/*)

random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

~/.config/scripts/theme-switcher.sh "$random_wallpaper"
