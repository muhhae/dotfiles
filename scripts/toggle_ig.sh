#!/bin/bash

SPECIAL_WORKSPACE_NAME="Instagram"
APP_INITIAL_TITLE="instagram.com_/"
APP="/home/muhhae/instagram-client/dist/instagram-client/instagram-client-linux_x64"
size=15

APP_INFO=$(hyprctl clients -j | jq -r '
        [
            .[] | select(.initialTitle == "'"$APP_INITIAL_TITLE"'")
        ] | first
')
APP_WORKSPACE=$(echo "$APP_INFO" | jq -r '.workspace | .name')
APP_ADDR=$(echo "$APP_INFO" | jq -r '.address')

if [[ "$APP_INFO" == "null" ]]; then
    exec "$APP" &
    exit 0
fi

ACTIVE_WORKSPACE=$(hyprctl activeworkspace -j | jq -r '.name')

if [[ "$APP_WORKSPACE_NAME" == "special:$SPECIAL_WORKSPACE_NAME" ]]; then
    hyprctl dispatch movetoworkspace $ACTIVE_WORKSPACE,address:"$APP_ADDR"
elif [[ "$APP_WORKSPACE" == "$ACTIVE_WORKSPACE" ]]; then
    hyprctl dispatch movetoworkspacesilent "special:$SPECIAL_WORKSPACE_NAME,address:$APP_ADDR"
else
    hyprctl dispatch movetoworkspace $ACTIVE_WORKSPACE,address:$APP_ADDR
fi
