#!/bin/bash

USER=`stat -c "%G" /opt/ktrl/default.ron`
sudo -u $USER cp -P /opt/ktrl/womier.ron /opt/ktrl/cfg.ron
