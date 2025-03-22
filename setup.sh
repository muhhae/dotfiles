#!/bin/bash

DIR=$(dirname "$0")

find "$DIR/etc/zsh-theme" -maxdepth 1 -type f -exec ln -srf {} "$HOME/.oh-my-zsh/themes/" \;
find "$DIR/home-dir" -maxdepth 1 -type f -exec ln -srf {} "$HOME/" \;
find "$DIR/config-dir" -maxdepth 1 -type f -exec ln -srf {} "$HOME/.config/" \;

