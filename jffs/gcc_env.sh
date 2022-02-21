#!/bin/sh
export LDFLAGS="-Wl,-rpath=/opt/lib -Wl,--dynamic-linker=/opt/lib/ld-linux-aarch64.so.1 -L/opt/lib, -lstdc++"
export CFLAGS="-O2 -pipe -mcpu=cortex-a53 -fno-caller-saves "
export CPPFLAGS="$CFLAGS -I/opt/include"
export CXXFLAGS="$CFLAGS $LDFLAGS"
export CC=gcc
export CXX=g++
export ACLOCAL_PATH=/opt/share/aclocal
