export LFS=$(realpath $(dirname ${BASH_SOURCE[0]}))
export HOST_ROOT=$LFS/buildroot/output/host
export TARGET_ROOT=$LFS/buildroot/output/target
export PATH="$PATH:$HOST_ROOT/bin:$HOST_ROOT/sbin:$HOST_ROOT/usr/bin:$HOST_ROOT/usr/sbin"
export HOSTCC="/usr/bin/gcc"
export HOSTCFLAGS=""
export ARCH=i386
export INSTALL_MOD_PATH=$TARGET_ROOT
export CROSS_COMPILE="$HOST_ROOT/usr/bin/i686-buildroot-linux-uclibc-"
export DEPMOD=$HOST_ROOT/sbin/depmod
export KERNEL=$LFS/buildroot/output/build/linux-custom
pkgconf=$HOST_ROOT/usr/bin/pkg-config
export TARGET_CFLAGS=$(eval $pkgconf --cflags --libs-only-L $(eval $pkgconf --list-all | awk "{print \$1}"))
