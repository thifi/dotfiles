#!/bin/bash

STATE_FILE="/tmp/theme.state"
STATE=`cat $STATE_FILE`

if [ $STATE == "Pop" ]; then
    echo "Changing to Regolith"
    /usr/share/rofi/modi/look-selector.sh lascaille
    echo "Regolith" > $STATE_FILE
else
    echo "Changing to Pop"
    gsettings set org.gnome.desktop.interface gtk-theme Pop-dark
    echo "Pop" > $STATE_FILE
fi
