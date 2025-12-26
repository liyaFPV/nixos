#!/usr/bin/env bash
set -euo pipefail

USER_CFG_DIR="$HOME/.config"
WALLPAPERS_DIR="$HOME/wallpapers"
ETC_NIXOS_APP="/etc/nixos/app"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

read -rp "Применить системную конфигурацию? (y/n): " answer

case "$answer" in
  y|Y)
    echo "Копирую пользовательские конфиги…"
    rm -rf "$USER_CFG_DIR/hypr" "$USER_CFG_DIR/rofi" "$USER_CFG_DIR/waybar"
    rsync -a --delete "$SCRIPT_DIR/.config/hypr"   "$USER_CFG_DIR/"
    rsync -a --delete "$SCRIPT_DIR/.config/rofi"   "$USER_CFG_DIR/"
    rsync -a --delete "$SCRIPT_DIR/.config/waybar" "$USER_CFG_DIR/"

    echo "Копирую обои…"
    mkdir -p "$WALLPAPERS_DIR"
    rsync -a --delete "$SCRIPT_DIR/wallpapers/" "$WALLPAPERS_DIR/"

    echo "Копирую /etc/nixos/app…"
    sudo mkdir -p "$ETC_NIXOS_APP"
    sudo rsync -a --delete "$SCRIPT_DIR/nixos/app/" "$ETC_NIXOS_APP/"

    echo "Пересобираю NixOS…"
    sudo nixos-rebuild switch
    ;;
  n|N)
    echo "Копирую только пользовательские конфиги и обои…"
    rm -rf "$USER_CFG_DIR/hypr" "$USER_CFG_DIR/rofi" "$USER_CFG_DIR/waybar"
    rsync -a --delete "$SCRIPT_DIR/.config/hypr"   "$USER_CFG_DIR/"
    rsync -a --delete "$SCRIPT_DIR/.config/rofi"   "$USER_CFG_DIR/"
    rsync -a --delete "$SCRIPT_DIR/.config/waybar" "$USER_CFG_DIR/"

    mkdir -p "$WALLPAPERS_DIR"
    rsync -a --delete "$SCRIPT_DIR/wallpapers/" "$WALLPAPERS_DIR/"
    ;;
  *)
    echo "Ошибка: введите y или n" >&2
    exit 1
    ;;
esac

echo "Готово."