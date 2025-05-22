#
# Releases:
#     `uname -m`
#     https://github.com/Tcp-Ping/Tcping/releases


echo "TCPing"
sudo curl -L \
    -o /usr/local/bin/tcping \
    https://github.com/Tcp-Ping/Tcping/releases/download/v0.1.1/linux-x86-tcping

sudo chmod 0755 /usr/local/bin/tcping
