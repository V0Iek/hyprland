#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "theme-switcher: no path"
  exit 1
fi

IMAGE="$1"

swww img "$IMAGE" --transition-type=any --transition-fps=60 --transition-step=255

echo "$IMAGE"

matugen image "$IMAGE"

ln -sf "$HOME/.Wallpapers/$IMAGE" ~/.config/hypr/wallpaper
