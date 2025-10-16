#!/bin/bash
set -e
export PATH=/mxe/usr/bin:$PATH
export SRCDIR=$PWD/deps
export PREFIX=/mxe/usr/x86_64-w64-mingw32.static
mkdir -p $SRCDIR

function download {
  echo "--- Downloading.. ${SRCDIR}/$1 $2"
  test -f ${SRCDIR}/$1 && return
  curl -L -o ${SRCDIR}/$1.tmp $2
  mv ${SRCDIR}/$1.tmp ${SRCDIR}/$1
}

download mpg123-1.33.3.tar.bz2 https://sourceforge.net/projects/mpg123/files/mpg123/1.33.3/mpg123-1.33.3.tar.bz2/download
cd $SRCDIR
tar xf mpg123-1.33.3.tar.bz2
cd $SRCDIR/mpg123-1.33.3
./configure --host=x86_64-w64-mingw32.static --disable-shared --prefix=$PREFIX
make -j $(nproc)
make install

download libsndfile-1.2.2.tar.xz https://github.com/libsndfile/libsndfile/releases/download/1.2.2/libsndfile-1.2.2.tar.xz
cd $SRCDIR
tar xf libsndfile-1.2.2.tar.xz
cd libsndfile-1.2.2
./configure --host=x86_64-w64-mingw32.static --disable-shared --prefix=$PREFIX
make -j $(nproc)
make install
