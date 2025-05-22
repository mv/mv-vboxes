#!/usr/bin/env bash


export _ver=7.1.8
export _installed=$(/usr/sbin/VBoxService --version | cut -b 1-5)

echo
echo "Version  : [${_ver}]"
echo "Installed: [${_installed}]"
echo

if [ "${_ver}" != "${_installed}" ]
then
    /mnt/VBoxLinuxAdditions.run
else
    echo
    echo "Skip..."
    echo
fi

