#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

cd arch/package

rm .PKGINFO
rm ../filediskroot.pkg.tar.xz

touch ".PKGINFO"

echo "pkgname = initcpio-filediskroot"                            >> ".PKGINFO"
echo "pkgver = 1.0.0-1"                                           >> ".PKGINFO"
echo "pkgdesc = initcpio filediskroot module"                     >> ".PKGINFO"
echo "url = https://github.com/baselsayeh/filediskroot"           >> ."PKGINFO"
echo "builddate = $(date +%s)"                                    >> ".PKGINFO"
echo "packager = BaselSayeh <basel.sayeh@hotmail.com>"            >> ".PKGINFO"
echo "size = $(du -shb usr | cut -f 1)"                           >> ".PKGINFO"
echo "arch = x86_64"                                              >> ".PKGINFO"

chown -R root:root * .*

tar -cf - .PKGINFO * | xz -c -z - > ../filediskroot.pkg.tar.xz

rm .PKGINFO

cd ..

