#!/bin/bash

#  Reference: https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo npm install -g \
    typescript \
    ts-node \
    serverless \
    nodemon \
    alacritty-themes