#!/bin/bash

#if [ "$EUID" -ne 0 ]
#	then echo "Please run as root"
#	exit
#fi

#cd debian/package
cd debian

#chown -R root:root *

#Copy the mounting script
cp ../files/* usr/lib/looproot/
chmod 755 usr/lib/looproot/mount_loop_as_rootfs
chmod 755 usr/lib/looproot/looproot_initramfs_restore
chmod 644 usr/lib/looproot/*.gz

fakeroot dpkg-deb --build . ../initcpio-looproot.deb

rm usr/lib/looproot/*

cd ..

