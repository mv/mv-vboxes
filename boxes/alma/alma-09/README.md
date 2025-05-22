


# Steps

## Provision using Source

```
vagrant up  source
vagrant ssh source
```

### Get ISO.
Download and mount `VBoxGuestAdditions.iso` to `source` using VirtualBox GUI.

TODO: use CLI `VboxManage` to attach iso.


### Inside `source`

```
sudo su -
cd /scripts

dnf update -y

./vagrant.guest-additions.mount-sr0.sh
./vagrant.guest-additions.01.pre-req.rpm.sh
./vagrant.guest-additions.02.install.sh

dnf history          # check
dnf history undo 2   # clean

./install.epel.sh
./install.pkgs.sh

./install.bash-aliases.sh
./set.bashrc.sh
./set.vimrc.sh
./set.timezone.sh

./set.fs-swap-file.sh  # optional
```

### Outside `source`

Create an updated box.

```
vagrant package source
```


## Test `updated` machine


```
vagrant up  update
vagrant ssh update
```

### Inside `update`

```
ll
cat /etc/vimrc
htop
```

## Add new box

```
vagrant box list

vagrant box add    mv/alma-9/yyyy-mm-dd.1 package.box # new
vagrant box remove update/alma-9                      # temp
vagrant box list

```

### Cleanup

```
vagrant status

/bin/rm -rf ./package.box
vagrant destroy -y

vagrant status
```
