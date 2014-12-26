#! /bin/bash

TARGET=$1
SOURCE=$(dirname $0)/../rootfs
find $SOURCE -name "*~" -exec rm -fv {} \;
rsync -avz $SOURCE/ $TARGET
