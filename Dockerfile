# BUILD STAGE
FROM ubuntu:bionic AS builder

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install locales && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8
RUN apt-get -y install binutils subversion build-essential libncurses5-dev libz-dev gawk git ccache gettext libssl-dev xsltproc zip
RUN apt-get -y install python-dev python3-dev
RUN apt-get -y install curl wget time sudo tree
RUN apt-get -y install curl libc6-dev libc6-dev-i386
RUN apt-get -y install asciidoc bzip2 patch unzip zlib1g-dev lib32gcc1  flex uglifyjs gcc-multilib p7zip p7zip-full msmtp texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint
RUN useradd -d /home/lede -m -s /bin/bash lede
RUN rm -rf /var/lib/apt/lists/*

# FINAL STAGE
FROM ubuntu:bionic

LABEL maintainer="TossPig <docker@TossP.com>" \
    version="1.0.6" \
    description="lede编译环境"

ENV DEBIAN_FRONTEND noninteractive
ENV LANG zh_CN.utf8

COPY --from=builder / /
