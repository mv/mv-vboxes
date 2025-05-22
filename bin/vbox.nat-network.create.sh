#!/usr/bin/env bash
#
# Ref:
#   https://docs.oracle.com/en/virtualization/virtualbox/7.1/user/networkingdetails.html#network_nat_service
#
# 2025/05
# Marcus Vinicius Ferreira               ferreira.mv[ at ]gmail.com
#



VBoxManage natnetwork add    --netname natnet1 --network "192.168.15.0/24" --enable
VBoxManage natnetwork modify --netname natnet1 --dhcp on
VBoxManage natnetwork start  --netname natnet1

VBoxManage list natnetworks
