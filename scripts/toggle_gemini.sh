#!/bin/bash

SPECIAL_WORKSPACE_NAME="Gemini"
APP_INITIAL_TITLE="gemini.google.com_/app"
APP="/home/muhhae/gemini-client/dist/gemini-client/gemini-client-linux_x64"

GEMINI_INFO=$(hyprctl clients -j | jq -r '
        [
            .[] | select(.initialTitle == "'"$APP_INITIAL_TITLE"'")
        ] | first
')
GEMINI_WORKSPACE=$(echo "$GEMINI_INFO" | jq -r '.workspace | .name')
GEMINI_ADDR=$(echo "$GEMINI_INFO" | jq -r '.address')

if [[ "$GEMINI_INFO" == "null" ]]; then
    exec "$APP" &
    exit 0
fi

ACTIVE_WORKSPACE=$(hyprctl activeworkspace -j | jq -r '.name')

if [[ "$GEMINI_WORKSPACE_NAME" == "special:$SPECIAL_WORKSPACE_NAME" ]]; then
    hyprctl dispatch movetoworkspace $ACTIVE_WORKSPACE,address:"$GEMINI_ADDR"
elif [[ "$GEMINI_WORKSPACE" == "$ACTIVE_WORKSPACE" ]]; then
    hyprctl dispatch movetoworkspacesilent "special:$SPECIAL_WORKSPACE_NAME,address:$GEMINI_ADDR"
else
    hyprctl dispatch movetoworkspace $ACTIVE_WORKSPACE,address:$GEMINI_ADDR
fi
