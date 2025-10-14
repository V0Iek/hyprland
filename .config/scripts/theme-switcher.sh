#!/bin/sh

if [ "$#" -ne 1 ]; then
  echo "theme-switcher: no path"
  exit 1
fi

IMAGE="$1"

swww img "$IMAGE" --transition-type=center --transition-fps=60 --transition-step=255

echo "$IMAGE"

matugen image "$IMAGE"
