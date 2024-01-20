#!/bin/bash

#if [ "$EUID" -ne 0 ]
#	then echo "Please run as root"
#	exit
#fi

cd arch/package

rm -f .PKGINFO
rm -f ../filediskroot.pkg.tar.xz

touch ".PKGINFO"

echo "pkgname = initcpio-looproot"                                >> ".PKGINFO"
echo "pkgver = 1.0.0-1"                                           >> ".PKGINFO"
echo "pkgdesc = initcpio looproot module"                         >> ".PKGINFO"
echo "url = https://github.com/baselsayeh/filediskroot"           >> ."PKGINFO"
echo "builddate = $(date +%s)"                                    >> ".PKGINFO"
echo "packager = BaselSayeh <basel.sayeh@hotmail.com>"            >> ".PKGINFO"
echo "size = $(du -shb usr | cut -f 1)"                           >> ".PKGINFO"
echo "arch = x86_64"                                              >> ".PKGINFO"

#chown -R root:root * .*

cp ../../mount_loop_as_rootfs usr/lib/looproot/
chmod 755 usr/lib/looproot/mount_loop_as_rootfs

fakeroot tar -cf - .PKGINFO * | xz -c -z - > ../../initcpio-looproot.pkg.tar.xz

rm usr/lib/looproot/mount_loop_as_rootfs

rm .PKGINFO

cd ..

