#!/bin/bash

SPECIAL_WORKSPACE_NAME="Terminal"
APP_INITIAL_CLASS="com.mitchellh.ghostty"
APP="ghostty"

INFO=$(hyprctl clients -j | jq -r '
        [
            .[] | select(.initialTitle == "'"$APP_INITIAL_TITLE"'")
        ] | first
')
WORKSPACE=$(echo "$INFO" | jq -r '.workspace | .name')
ADDR=$(echo "$INFO" | jq -r '.address')

if [[ "$INFO" == "null" ]]; then
    exec "$APP" &
    exit 0
fi

ACTIVE_WORKSPACE=$(hyprctl activeworkspace -j | jq -r '.name')

if [[ "$WORKSPACE_NAME" == "special:$SPECIAL_WORKSPACE_NAME" ]]; then
    hyprctl dispatch movetoworkspace $ACTIVE_WORKSPACE,address:"$ADDR"
elif [[ "$WORKSPACE" == "$ACTIVE_WORKSPACE" ]]; then
    hyprctl dispatch movetoworkspacesilent "special:$SPECIAL_WORKSPACE_NAME,address:$ADDR"
else
    hyprctl dispatch movetoworkspace $ACTIVE_WORKSPACE,address:$ADDR
fi
