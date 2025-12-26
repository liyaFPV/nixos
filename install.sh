#!/usr/bin/env bash
set -euo pipefail

USER_CFG_DIR="$HOME/.config"
ETC_NIXOS="/etc/nixos"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

read -rp "Применить системную конфигурацию? (y/n): " answer

case "$answer" in
  y|Y)
    echo "Копирую пользовательские конфиги…"
    rm -rf "$USER_CFG_DIR/hypr" "$USER_CFG_DIR/rofi" "$USER_CFG_DIR/waybar"
    rsync -a --delete "$SCRIPT_DIR/.config/hypr"   "$USER_CFG_DIR/"
    rsync -a --delete "$SCRIPT_DIR/.config/rofi"   "$USER_CFG_DIR/"
    rsync -a --delete "$SCRIPT_DIR/.config/waybar" "$USER_CFG_DIR/"

    echo "Копирую /etc/nixos…"
    sudo rm -rf "$ETC_NIXOS"/*
    sudo rsync -a --delete "$SCRIPT_DIR/nixos/" "$ETC_NIXOS/"

    echo "Пересобираю NixOS…"
    sudo nixos-rebuild switch
    ;;
  n|N)
    echo "Копирую только пользовательские конфиги…"
    rm -rf "$USER_CFG_DIR/hypr" "$USER_CFG_DIR/rofi" "$USER_CFG_DIR/waybar"
    rsync -a --delete "$SCRIPT_DIR/.config/hypr"   "$USER_CFG_DIR/"
    rsync -a --delete "$SCRIPT_DIR/.config/rofi"   "$USER_CFG_DIR/"
    rsync -a --delete "$SCRIPT_DIR/.config/waybar" "$USER_CFG_DIR/"
    ;;
  *)
    echo "Ошибка: введите y или n" >&2
    exit 1
    ;;
esac

echo "Готово."