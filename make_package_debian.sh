#!/bin/bash

#if [ "$EUID" -ne 0 ]
#	then echo "Please run as root"
#	exit
#fi

#cd debian/package
cd debian

rm -Rf DEBIAN
mkdir DEBIAN

#touch "DEBIAN"

cat > DEBIAN/control <<EOL
Package: initcpio-looproot
Version: 1.0
Maintainer: Basel Sayeh
Architecture: all
Description: This package allows you to use a file as the rootfs of your system
EOL

#chown -R root:root *

#Copy the mounting script
cp ../mount_loop_as_rootfs usr/lib/looproot/
chmod 755 usr/lib/looproot/mount_loop_as_rootfs

fakeroot dpkg-deb --build . ../initcpio-looproot.deb

rm usr/lib/looproot/mount_loop_as_rootfs

rm -Rf DEBIAN

cd ..

