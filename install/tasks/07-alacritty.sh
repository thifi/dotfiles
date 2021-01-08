#!/bin/bash

set -e

cd /tmp

# Alacritty: doesn't work when install from Nix (same goes for Kitty)
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt-get update
sudo apt-get install -y alacritty

# Install JetBrains Mono for alacritty
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.221.zip
unzip JetBrainsMono-2.221.zip
mkdir -p ~/.local/share/fonts/
mv fonts/ttf/JetBrainsMono-*.ttf ~/.local/share/fonts/

cd ~/dotfiles
stow alacritty