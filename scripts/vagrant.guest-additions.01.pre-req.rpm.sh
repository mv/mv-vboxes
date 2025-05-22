
set -x

sudo dnf update -y

# updated
sudo dnf install -y kernel-devel kernel-devel bzip2
sudo dnf install -y kernel-devel-`uname -r`

# ref
#udo yum install -y kernel-devel kernel-headers gcc make
#udo yum install -y bzip2 dkms

