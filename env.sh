LFS=$(realpath $(dirname $_))
export PATH="$LFS/buildroot/output/host/bin:$LFS/buildroot/output/host/sbin:$LFS/buildroot/output/host/usr/bin:$LFS/buildroot/output/host/usr/sbin:$PATH"
export HOSTCC="/usr/bin/gcc"
export HOSTCFLAGS=""
export ARCH=i386
export INSTALL_MOD_PATH=$LFS/buildroot/output/target
export CROSS_COMPILE="$LFS/buildroot/output/host/usr/bin/i686-buildroot-linux-uclibc-"
export DEPMOD=$LFS/buildroot/output/host/sbin/depmod
export KERNEL=$LFS/buildroot/output/build/linux-custom
