FROM archlinux/base:latest

MAINTAINER zocker-160

RUN pacman --noconfirm -Syyu
RUN pacman --noconfirm -Sy archlinux-keyring
RUN pacman-key --init
RUN pacman-key --populate archlinux

RUN pacman --noconfirm -Syu --needed procps-ng gcc base-devel distcc python git mercurial bzr subversion openssh wget yarn
RUN rm -rf /var/cache/pacman/pkg/*

RUN useradd -m -d /build -s /bin/bash builder

WORKDIR /builder

RUN chown -R builder /builder
RUN chmod 777 -R /builder

RUN echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo 'MAKEFLAGS="-j2"' >> /etc/makepkg.conf

COPY zbuilder.sh /usr/bin
RUN chmod +x /usr/bin/zbuilder.sh

VOLUME /builder

CMD zbuilder.sh
