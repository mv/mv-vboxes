
# Ref:
#   https://wiki.almalinux.org/repos/Extras.html#epel
#   https://docs.fedoraproject.org/en-US/epel/getting-started/#_centos_stream_9
#

echo "EPEL."

sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
#udo dnf install -y epel-release

sudo dnf config-manager --set-enabled crb

sudo dnf install -y    \
    htop btop      \
    wget rsync nc ipcalc \
    make vim file dos2unix tree \
    bzip2 zip unzip xz

# Extra
mkdir -p /root/.config/htop
