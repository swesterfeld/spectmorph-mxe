FROM ubuntu:22.04

RUN apt-get update && apt-get -y install git wget autoconf automake libtool-bin \
                       autopoint bison flex gperf intltool lzip ruby \
                       p7zip-full python-is-python3 libgdk-pixbuf2.0-bin \
                       pkg-config python3-mako build-essential \
                       libssl-dev python3-distutils libpcre3-dev \
                       libpcre2-dev python3-packaging curl

WORKDIR /mxe
