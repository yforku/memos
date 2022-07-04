#!/bin/bash
# VER06: Mon 04 Jul 2022 14:00
# VER05: Tue 03 May 2022 18:30
# Adapted from LFS:  © 1999-2022 Gerard Beekmans
# Modified by C. BinKadal. See file LICENCE-MIT.
#
BINUTILS="binutils-2.38"
TARBALL="$LFS/sources/$BINUTILS.tar.xz"
[ -f $TARBALL ]            || { echo "$TARBALL file: Not found";        exit 1; }
[[ "$(whoami)" == "lfs" ]] || { echo 'Run this script with user "LFS"'; exit 2; }
time {
    echo "HOSTNAME: $(hostname) -- DATE: $(date)"
    pushd  $LFS/sources/
    rm -rf $BINUTILS/
    echo  "tar..."
    tar    xf $TARBALL
    cd     $BINUTILS/
    mkdir -pv build/
    cd     build/
    echo  "configure..."
    ../configure --prefix=$LFS/tools \
                 --with-sysroot=$LFS \
                 --target=$LFS_TGT   \
                 --disable-nls       \
                 --disable-werror &> /dev/null
    echo "make..."
    make &> /dev/null
    echo "make install"
    make install &> /dev/null
    popd
    rm -rf $BINUTILS/
    CPUINFO=$(grep -E 'model +name.+' /proc/cpuinfo | head -1 |\
       awk '{$1="";$2="";$3="";print}' | sed -e 's/^   //')
    MYMEM=$(free  --giga|grep ^Mem:|awk  '{print $2}')
    MYSWAP=$(free --giga|grep ^Swap:|awk '{print $2}')
    echo "Memory: $MYMEM GB -- Swap: $MYSWAP GB -- MAKEFLAGS: $MAKEFLAGS"
    echo -n "Standard Build Unit (SBU) for $CPUINFO"
} 

