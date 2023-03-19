#!/bin/bash
set -Eeuo pipefail

docker build -f Dockerfile -t spectmorph-mxe .
docker run -v $PWD:/data -t spectmorph-mxe cJvf /data/spectmorph-mxe.tar.xz /mxe/usr
