#! /bin/bash

if test -z "$1";
then
	echo "ERROR: pls specify a software to build!"
	exit 1
fi
git clone https://aur.archlinux.org/$1.git ~/source
echo "found $(nproc) cores"
cd ~/source && makepkg -s -c -C --noconfirm --noprogressbar | tee ~/$1-build.log
cp ~/source/*.pkg.tar.* /results
cp ~/$1-build.log /results
