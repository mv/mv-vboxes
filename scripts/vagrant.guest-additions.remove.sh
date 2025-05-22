#!/usr/bin/env bash


[ "${1}" != "-f" ] && {
    echo
    echo Usage: $0 -f
    echo
    exit
}

cd /

echo "Unmount"
sudo umount /media/VBoxGuestAdditions
sudo rmdir  /media/VBoxGuestAdditions

echo "Scripts cleanup..."
sudo /bin/rm -rf /iso

echo "DNF cleanup..."
sudo dnf history undo 2 -y
