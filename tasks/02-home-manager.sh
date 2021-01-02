#!/bin/bash

set -e

cd ~/dotfiles
stow home-manager

. /home/$USER/.nix-profile/etc/profile.d/nix.sh
nix-shell '<home-manager>' -A install
