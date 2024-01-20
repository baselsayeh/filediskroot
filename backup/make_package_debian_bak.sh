#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

#cd debian/package
cd debian

rm -Rf DEBIAN
mkdir DEBIAN

#touch "DEBIAN"

cat > DEBIAN/control <<EOL
Package: filediskroot
Version: 1.0
Maintainer: Basel Sayeh
Architecture: all
Description: This package allows you to use a file as the rootfs of your system
EOL

chown -R root:root *

dpkg-deb --build . ../filediskroot.deb

rm -Rf DEBIAN

cd ..

