#!/bin/env bash

nvim ~/cmd

command=$(sed -n '/--COMMAND START--/,/--COMMAND END--/{//!p; /--COMMAND END--/q}' ~/cmd)
if [[ -z $command ]]; then
    echo "No command to run!"
    exit 1
fi

confirm=""
while [[ $confirm != "y" ]]; do
    if [[ $confirm == "n" ]]; then
        exit 0
    fi
    echo -e "Do you want to run (y/n):$command"
    read -n 1 confirm
done

echo ""
bash -c "$command"
