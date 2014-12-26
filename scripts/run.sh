#! /bin/bash

SCRIPTS=$(realpath $(dirname $0))

cd $1 &> /dev/null

qemu-system-i386 \
	-hda rootfs.ext2 \
	-kernel bzImage \
	-m 512M \
	-append "root=/dev/sda console=ttyS0" \
	-localtime \
	-serial stdio \
	-device e1000,netdev=net0 \
	-netdev tap,id=net0,ifname=qemu0,script=$SCRIPTS/tanifup.sh,downscript=$SCRIPTS/tanifdown.sh
