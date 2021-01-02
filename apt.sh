#!/bin/bash

set -e

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install -y google-chrome-stable # tiny mouse cursor @home-manager

sudo apt-get install -y keepass2 # awful and unreadable colorschema @home-manager
sudo apt-get install -y alacritty # doesn't work when install from Nix (same goes for Kitty)