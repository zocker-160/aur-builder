FROM archlinux

MAINTAINER zocker-160

# stolen from https://github.com/qutebrowser/qutebrowser/commit/478e4de7bd1f26bebdcdc166d5369b2b5142c3e2
# WORKAROUND for glibc 2.33 and old Docker
# See https://github.com/actions/virtual-environments/issues/2658
# Thanks to https://github.com/lxqt/lxqt-panel/pull/1562
RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
    curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
    bsdtar -C / -xvf "$patched_glibc"

RUN pacman --noconfirm -Syyu
RUN pacman --noconfirm -Sy archlinux-keyring
RUN pacman-key --init
RUN pacman-key --populate archlinux

RUN pacman --noconfirm -Syu --needed procps-ng gcc base-devel distcc python git mercurial bzr subversion openssh wget yarn nano
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
