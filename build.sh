#!/bin/bash
set -Eeuo pipefail

git clone https://github.com/mxe/mxe.git || echo clone fail
cd mxe
git checkout -b mxe-spectmorph 2ffe7bb05ce08a036cc1e39bdd6962e19e0f6321 || echo branch fail
cd ..
cp mxe-settings.mk mxe/settings.mk
cp build-deps.sh mxe

docker build -f Dockerfile -t spectmorph-mxe .
docker run -v $PWD/mxe:/mxe -t spectmorph-mxe make
docker run -v $PWD/mxe:/mxe -t spectmorph-mxe ./build-deps.sh
echo tar cJvf "spectmorph-mxe-$(date '+%Y-%m-%d').tar.xz" mxe/usr
