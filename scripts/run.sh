#! /bin/bash

cd $1 /dev/null

NETIFACE=qemu1

tunctl -t $NETIFACE
ifup $NETIFACE
qemu-system-i386 \
	-hda rootfs.ext2 \
	-kernel bzImage \
	-m 512M \
	-append "root=/dev/sda console=ttyS0" \
	-nographic \
	-localtime \
	-net nic,vlan=0 \
	-net tap,vlan=0,ifname=$NETIFACE
ifdown $NETIFACE
tunctl -d $NETIFACE
