#!/bin/sh

# xserver startup script
# note: the .xsession and .xinitrc scripts seem not to be
# run in Ubuntu during X server startup. In order to run this script
# anyway, it should be added to System/Preferences/Start-Applications

# save xserver environment to file, so
# it can be accessed later by other scripts
touch $HOME/.Xenv
chmod 600 $HOME/.Xenv
env | grep XAUTHORITY >> .Xenv
echo export XAUTHORITY >> .Xenv
