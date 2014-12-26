#! /bin/bash

cd $1 /dev/null

NETIFACE=qemu0

#tunctl -t $NETIFACE
#ifup $NETIFACE
qemu-system-i386 \
	-hda rootfs.ext2 \
	-kernel bzImage \
	-m 512M \
	-append "root=/dev/sda console=ttyS0" \
	-localtime \
	-serial stdio \
#	-net nic,vlan=0 \
#	-net tap,vlan=0,ifname=$NETIFACE
#ifdown $NETIFACE
#tunctl -d $NETIFACE
