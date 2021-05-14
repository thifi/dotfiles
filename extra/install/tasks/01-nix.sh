#!/bin/bash

set -e

curl -L "https://nixos.org/nix/install" | sh

# echo "if [ -e /home/$USER/.nix-profile/etc/profile.d/nix.sh ]; then . /home/$USER/.nix-profile/etc/profile.d/nix.sh; fi" >> ~/.bashrc
. /home/$USER/.nix-profile/etc/profile.d/nix.sh

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
