#!/bin/bash -ex
# Setup script to install everything needed


# Enable subl CLI utility
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl


# Needs to be handled differently since there is `readlink -f` fails on Mac OS
# SCRIPT_DIR=$(dirname $(readlink -f $0))

# $SCRIPT_DIR/link
