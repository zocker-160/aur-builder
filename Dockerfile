FROM archlinux

MAINTAINER zocker-160

RUN pacman --noconfirm -Syyu
RUN pacman --noconfirm -Sy archlinux-keyring
RUN pacman-key --init
RUN pacman-key --populate archlinux

RUN pacman --noconfirm -Syu --needed procps-ng gcc base-devel distcc python git mercurial bzr subversion openssh wget yarn nano
# this would be needed for building icecat
#RUN pacman --noconfirm -Syu pacaur
#RUN pacaur -S --noedit --noconfirm perl-file-rename
RUN rm -rf /var/cache/pacman/pkg/*

RUN useradd -m -d /build -s /bin/bash builder

RUN echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "MAKEFLAGS=\"-j$(nproc)\"" >> /etc/makepkg.conf

COPY zbuilder.sh /usr/bin
RUN chmod +x /usr/bin/zbuilder.sh
COPY zabuilder.sh /usr/bin
RUN chmod +x /usr/bin/zabuilder.sh
RUN mkdir /results
RUN chown -R builder:builder /results

WORKDIR /results
#VOLUME /results

USER builder

ENTRYPOINT ["zbuilder.sh"]
