#!/bin/bash

DIR=$(dirname "$0")

rm -r $HOME/.zshrc && ln -sr $DIR/.zshrc $HOME/.

rm -r $HOME/.config/ags && ln -sr $DIR/ags $HOME/.config/.
rm -r $HOME/.config/hypr && ln -sr $DIR/hypr $HOME/.config/.
rm -r $HOME/.config/nvim && ln -sr $DIR/nvim $HOME/.config/.
rm -r $HOME/.config/swaync/ && ln -sr $DIR/swaync $HOME/.config/.
rm -r $HOME/.config/waybar/ && ln -sr $DIR/waybar $HOME/.config/.
rm -r $HOME/.config/wezterm/ && ln -sr $DIR/wezterm $HOME/.config/.
rm -r $HOME/.config/kitty/ && ln -sr $DIR/kitty $HOME/.config/.
rm -r $HOME/.config/xdg-desktop-portal && ln -sr $DIR/xdg-desktop-portal $HOME/.config/.
rm -r $HOME/.config/wofi && ln -sr $DIR/wofi $HOME/.config/.
rm -r $HOME/.config/alacritty && ln -sr $DIR/alacritty $HOME/.config/.
rm -r $HOME/.config/networkmanager-dmenu && ln -sr $DIR/networkmanager-dmenu $HOME/.config/.
rm -r $HOME/.config/spicetify && ln -sr $DIR/spicetify $HOME/.config/.
rm -r $HOME/.config/walker && ln -sr $DIR/walker $HOME/.config/.
rm -r $HOME/.config/ghostty && ln -sr $DIR/ghostty $HOME/.config/.

ln -sr $DIR/zsh-theme/* $HOME/.oh-my-zsh/themes/
