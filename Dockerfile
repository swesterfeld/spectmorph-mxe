FROM ubuntu:22.04

RUN apt-get update && apt-get -y install git wget autoconf automake libtool-bin \
                       autopoint bison flex gperf intltool lzip ruby \
                       p7zip-full python-is-python3 libgdk-pixbuf2.0-bin \
                       pkg-config python3-mako build-essential \
                       libssl-dev python3-distutils libpcre3-dev

RUN git clone https://github.com/mxe/mxe.git

WORKDIR mxe
RUN git checkout -b mxe-spectmorph 720b768cef54c52f75ac69a8e0ea037b00cbf8bf

ADD . /config
RUN cp /config/mxe-settings.mk settings.mk
RUN make
