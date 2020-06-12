#!/bin/bash

echo "Linking up the dotfiles to your home directory ($HOME)"

cd ~/dotfiles
stow i3
stow zsh
stow spacemacs
stow config
cd -

rm -f /opt/ktrl/cfg.ron
ln -s ~/dotfiles/ktrl/cfg.ron /opt/ktrl/cfg.ron

echo "DONE!"
