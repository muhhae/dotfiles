#!/bin/bash

while true
do
    level=`cat /sys/class/power_supply/BAT1/capacity`
    status=`cat /sys/class/power_supply/BAT1/status`

    if [[ $level -le 30 && $status != "Charging" ]]
    then
        notify-send \
            "Battery is fucking low"\
            "Current battery level is ${level}% , Plug the fkin charger"\
            -u critical\
            -i battery-caution\
            -w
    fi

    if [ $level -le 10 ]; then
        sleep 1
    elif [ $level -le 20 ]; then
        sleep 5
    else
        sleep 60
    fi
done
