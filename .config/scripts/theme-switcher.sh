#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "theme-switcher: no path"
  exit 1
fi

IMAGE="$1"

swww img "$IMAGE" --transition-type=any --transition-fps=60 --transition-step=255

echo "$IMAGE"

rm ~/.config/hypr/wallpaper.png
cp "$IMAGE" ~/.config/hypr/wallpaper.png
