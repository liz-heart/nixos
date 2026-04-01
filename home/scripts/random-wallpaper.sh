#!/usr/bin/env bash

WALL_DIR="$HOME/walls"

selected_path="$(
  find "$WALL_DIR" -maxdepth 1 -type f \
    \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.gif' -o -iname '*.png' -o -iname '*.webp' \) \
    ! -name ".*" \
    | shuf -n1
)"

if [ -f "$selected_path" ]; then
  # Tell QuickShell (panel, state, UI)
  quickshell ipc call randomwallpaper apply "$selected_path"

  # Tell Hyprland's renderer (THIS is the missing link)
  swww img "$selected_path"
fi
