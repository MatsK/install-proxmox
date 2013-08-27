#!/bin/bash

cat << EOL > /etc/apt/sources.list
# Debian Wheezy
deb http://ftp.at.debian.org/debian wheezy main contrib
# PVE packages provided by proxmox.com
deb http://download.proxmox.com/debian wheezy pve
# Debian Wheezy security updates
deb http://security.debian.org/ wheezy/updates main contrib
EOL

wget -O- "http://download.proxmox.com/debian/key.asc" | apt-key add -

apt-get update && apt-get dist-upgrade -y

apt-get install pve-firmware pve-kernel-2.6.32-23-pve pve-headers-2.6.32-23-pve build-essential git vim acpi -y

apt-get remove linux-image-amd64 linux-image-3.2.0-4-amd64 -y

update-grub

apt-get install proxmox-ve-2.6.32 ntp ssh lvm2 postfix ksm-control-daemon vzprocps open-iscsi bootlogd -y

apt-get purge network-manager -y
