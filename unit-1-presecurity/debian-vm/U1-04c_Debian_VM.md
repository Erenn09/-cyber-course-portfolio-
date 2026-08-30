# My Debian 13 Lab VM

## VM identity
- VM name (in VirtualBox): debian-lab
- Hostname (inside Debian): debian-lab
- Debian version (from `cat /etc/debian_version`): 13.6
- Kernel version (from `uname -r`): 6.12.107+deb13-amd64

## Allocated resources
- CPU cores: 2
- RAM: 2048 MB
- Disk size: 30 GB
- Network mode: NAT (default)

## User account
- Username: eren
- Root account: disabled
- Sudo works: yes

## Desktop environment
- GNOME

## Guest Additions
- Installed: yes
- Version (from `VBoxClient --version` in the VM): 7.2.16

## Snapshot
- Snapshot name: clean-install-guest-additions
- Date taken: 30.08.2026

## What worked, what didn't
Installing Debian was pretty straightforward, leaving the root password empty worked fine to setup sudo automatically. I had some trouble getting Guest Additions to work at first because the screen wouldn't auto-resize, and I made a typo trying to mount the CD in the terminal. Once I mounted `/dev/sr0` correctly and ran the installer script, everything loaded up fine after a reboot.
