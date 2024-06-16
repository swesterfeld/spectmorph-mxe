#!/bin/bash
set -Eeuo pipefail

git clone https://github.com/mxe/mxe.git || echo clone fail
cd mxe
git checkout -b mxe-spectmorph 8fa8c126f64a0ca6d263c641632645db4f941f00 || echo branch fail
cd ..
cp mxe-settings.mk mxe/settings.mk

docker build -f Dockerfile -t spectmorph-mxe .
docker run -v $PWD/mxe:/mxe -t spectmorph-mxe make
echo tar cJvf "spectmorph-mxe-$(date '+%Y-%m-%d').tar.xz" mxe/usr
