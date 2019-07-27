FROM ubuntu
LABEL maintainer="TossPig <docker@TossP.com>" \
    version="1.0.6" \
    description="openwrt编译环境"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update
RUN apt-get -y install locales build-essential binutils asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip lib32gcc1 libc6-dev libc6-dev-i386 subversion flex node-uglify gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx-ucl curl wget time sudo bsdmainutils autoconf automake libtool tree gettext libattr1-dev python-dev python3-dev && rm -rf /var/lib/apt/lists/* && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8
RUN useradd -d /home/lede -m -s /bin/bash lede
