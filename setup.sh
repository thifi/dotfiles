#!/bin/bash

echo "Linking up the dotfiles to your home directory ($HOME)"

cd ~/dotfiles
stow i3
stow zsh
stow spacemacs
stow config
stow alt
stow xrandr
cd -

# ktrl setup

rm -f /opt/ktrl/*.ron
sudo rm -f /usr/local/bin/womier*
sudo rm -f /etc/udev/rules.d/80-womier.rules

ln -s ~/dotfiles/ktrl/default.ron /opt/ktrl/default.ron
ln -s ~/dotfiles/ktrl/womier.ron /opt/ktrl/womier.ron
ln -s ~/dotfiles/ktrl/default.ron /opt/ktrl/cfg.ron

sudo ln -s ~/dotfiles/ktrl/udev/womier-udev-add.sh /usr/local/bin/womier-udev-add.sh
sudo ln -s ~/dotfiles/ktrl/udev/womier-udev-remove.sh /usr/local/bin/womier-udev-remove.sh
sudo ln -s ~/dotfiles/ktrl/udev/80-womier.rules /etc/udev/rules.d/80-womier.rules

echo "DONE!"
