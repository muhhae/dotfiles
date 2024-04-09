#!/bin/bash

entries="⇠ Logout\n⏾ Suspend\n Lock\n⭮ Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|wofi --dmenu -H 345 -W 200 --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    killhypr.sh;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
  lock)
    exec swaylock;;
esac
