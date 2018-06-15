## **filediskroot**

Run Arch Linux from a disk image!
This initcpio module enables to use a file disk as a root filesystem.


## **Requirements**

 - Arch Linux : this module is designed with Arch Linux [boot process](https://wiki.archlinux.org/index.php/Arch_boot_process) in mind, it may work with another distirbutions with little or no modifications.
 - Root access : this module contains a custom hooks and some other files needed by mkinitcpio, and these locations is not accesible normally with non-root users.


## **Description**
filediskroot can enable to mount a rootfs inside a disk image, it looks for `filediskrootblock` and `filediskrootpath` kernel parameters and mount the disk/partition containing the rootfs disk image, and the rest of initrd scripts will take care of mounting the rootfs itself.
filediskroot is useful if you need to test an image containing arch without applying it to disk.


## **Package Instalation**
Sumply run `make_package.sh` as root, then install the resulting package via `pacman -U filediskroot.pkg.tar.xz`


## **Instalation Guide**
 1. Prepare arch root image via [this page from Arch wiki](https://wiki.archlinux.org/index.php/Install_from_existing_Linux) (if you have disk image, you can skip this step)
 2. Mount the image
 3. chroot into the image
 4. Install the package as shown in (`Package Instalation`) section
 5. Edit `/etc/mkinitcpio.conf` and add (`filediskroot`) inside the hooks section
 6. To use this module, you must include `filediskrootblock=[/dev/device]` in your kernel parameters and edit [/dev/device] to point to your device, and include `filediskrootpath=[path]` in your kernel parameters and edit [path] to point to your image file (without the leading slash).
 7. Use ``mkinitcpio -p linux`` to recreate initcpio


## **Notes**
 - After instalation, you might see `filediskrootblock or filediskrootpath kernel parameters is not found or empty` if you didn't include `filediskrootblock` or `filediskrootpath` in your kernel parameters, this is not harmful.
 - Currently, Only a device path in dev is supported in `filediskrootblock` (You can set that to an UUID via /dev/disk/by-uuid/[UUID]).
 - Currently, you have to copy your boot files (kernel + initrd and the bootloader, if you dont have that already) from the boot drive before booting the image.


## **Credits**
Author: Baselsayeh

Version: 1.0

Licence: GNU GPL v2

