#!/bin/bash

set -e

cd /tmp

# Chrome: tiny mouse cursor @home-manager
echo "Downloading Chrome's deb"
wget --quiet https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install -y ./google-chrome-stable_current_amd64.deb

# KeePass2: awful and unreadable colorschema @home-manager
sudo apt-get install -y keepass2