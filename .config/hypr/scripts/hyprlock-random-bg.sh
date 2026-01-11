#!/usr/bin/env bash

WALLPAPER_DIR="/home/liyavr/wallpapers"

WALL=$(find "$WALLPAPER_DIR" -type f \
  \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1)

exec hyprlock --image "$WALL"

