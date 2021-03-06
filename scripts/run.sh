#! /bin/bash

SCRIPTS=$(realpath $(dirname $0))

cd $1 &> /dev/null

if [[ -z "$SUBNET" ]]; then
	export SUBNET="20.0.0"
	echo "missing SUBNET. using default $SUBNET"
fi

if [[ -z "$TAP" ]]; then
	export TAP="qemu0"
	echo "missing TAP. using default $TAP"
fi

qemu-system-i386 \
	-hda rootfs.ext2 \
	-kernel bzImage \
	-m 512M \
	-append "root=/dev/sda console=ttyS0 subnet=$SUBNET" \
	-localtime \
	-serial stdio \
	-device e1000,netdev=net0 \
	-netdev tap,id=net0,ifname=$TAP,script=$SCRIPTS/tanifup.sh,downscript=$SCRIPTS/tanifdown.sh
