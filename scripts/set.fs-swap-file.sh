###
### swap-file.sh
###

### swapfile: 1024*1024 =   1G (1048576)
#/bin/dd if=/dev/zero of=/swapfile1 bs=1024 count=1048576

### swapfile: 1024*512  = 512M (524288)
/bin/dd if=/dev/zero of=/swapfile1 bs=1024 count=524288

/bin/chown root:root /swapfile1
/bin/chmod 0600 /swapfile1

/sbin/mkswap /swapfile1
/sbin/swapon /swapfile1

/bin/cat<<FSTAB >> /etc/fstab

/swapfile1  swap      swap    defaults                     0  0

FSTAB

# vim:ft=sh:

