#!/bin/bash

set -e

git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
rm -rf ~/.emacs.d/private
