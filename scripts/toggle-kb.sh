#!/bin/bash
#~/.config/waybar/toggle-laptop-keyboard.sh &
#  _____                 _
# |_   _|__   __ _  __ _| | ___
#   | |/ _ \ / _` |/ _` | |/ _ \
#   | | (_) | (_| | (_| | |  __/
#   |_|\___/ \__, |\__, |_|\___|
#            |___/ |___/
#

CACHE_FILE="$HOME/.cache/laptop-keyboard-disabled"

if [ -f "$CACHE_FILE" ] ;then
    rm "$CACHE_FILE"
    sh -c "hyprctl keyword 'device[at-translated-set-2-keyboard]:enabled' 1"
else
    touch "$CACHE_FILE"
    sh -c "hyprctl keyword 'device[at-translated-set-2-keyboard]:enabled' 0"
fi
