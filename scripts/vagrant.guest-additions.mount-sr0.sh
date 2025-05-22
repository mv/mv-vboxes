#!/usr/bin/env bash

# Ref:
#   https://unix.stackexchange.com/questions/149393/mounting-dev-dvd-media-on-virtualbox
#

## Virtual Box GUI:
##   - attach as SATA
##
mount /dev/sr0  /mnt
mount | grep '^/dev' | column -t | sort
