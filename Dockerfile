# BUILD STAGE
FROM ubuntu:20.04 AS builder

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install locales && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8
RUN apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync fish
RUN useradd -d /home/lede -m -s /bin/bash lede
RUN rm -rf /var/lib/apt/lists/*

# FINAL STAGE
FROM ubuntu:20.04

LABEL maintainer="TossPig <docker@TossP.com>" \
    version="5.0.0" \
    description="lede编译环境"

ENV DEBIAN_FRONTEND noninteractive
ENV LANG zh_CN.utf8

COPY --from=builder / /
