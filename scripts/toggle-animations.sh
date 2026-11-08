#!/usr/bin/env bash
# Toggle Hyprland animations at runtime (Lua config aware).
cache_file="$HOME/.cache/toggle_animation"

if [ -f "$cache_file" ]; then
    hyprctl eval 'hl.config({ animations = { enabled = true } })'
    rm -f "$cache_file"
    hyprctl notify 1 2000 "rgb(b1c5ff)" "Animations on"
else
    hyprctl eval 'hl.config({ animations = { enabled = false } })'
    touch "$cache_file"
    hyprctl notify 1 2000 "rgb(b1c5ff)" "Animations off"
fi
