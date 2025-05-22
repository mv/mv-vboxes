#!/usr/bin/env bash

# Ref:
#   https://developer.hashicorp.com/vagrant/docs/providers/virtualbox/boxes#virtualbox-guest-additions
#
# Most recent:
#   https://download.virtualbox.org/virtualbox/
#

[ "${1}" == "" ] && {
    echo
    echo Usage: $0 <version>
    echo
    exit
}

#xport _ver=7.1.8
export _ver="${1}"

# wget http://download.virtualbox.org/virtualbox/${_ver}/VBoxGuestAdditions_${_ver}.iso

echo
echo "GuestAdditions: [${_ver}]"
echo
#kdir -p /media/VBoxGuestAdditions
mount -o loop,ro /iso/VBoxGuestAdditions_${_ver}.iso /mnt


sudo sh /mnt/VBoxGuestAdditions/VBoxLinuxAdditions.run
