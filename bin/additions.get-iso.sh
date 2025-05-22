#!/usr/bin/env bash
#
# Ref:
#   https://developer.hashicorp.com/vagrant/docs/providers/virtualbox/boxes#virtualbox-guest-additions
#
# Most recent:
#   https://download.virtualbox.org/virtualbox/
#
#
# 2025/05
# Marcus Vinicius Ferreira               ferreira.mv[ at ]gmail.com

_ver=7.1.8

if [ "$1" != "" ]
then _ver="${1}"
fi

iso="VBoxGuestAdditions_${_ver}.iso"
url="http://download.virtualbox.org/virtualbox/${_ver}/${iso}"

echo
echo " Get: ${iso}"

if [ -f "${iso}" ]
then
    echo "File: Already exists."
    echo
    exit 1
fi

wget ${url}
echo

exit 0
