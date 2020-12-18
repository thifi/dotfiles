#!/bin/bash

echo "Linking up the dotfiles to your home directory ($HOME)"

cd ~/dotfiles
stow spacemacs
stow config
stow xrandr
stow vscode
cd -

echo "DONE!"
