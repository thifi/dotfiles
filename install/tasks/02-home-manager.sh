#!/bin/bash

set -e

. /home/$USER/.nix-profile/etc/profile.d/nix.sh
nix-shell '<home-manager>' -A install
