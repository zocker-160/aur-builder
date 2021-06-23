#! /bin/bash

echo "found $(nproc) cores"
makepkg -s -c -C --noconfirm --noprogressbar | tee ~/$1-build.log
cp ./*.pkg.tar.* /results
cp ~/$1-build.log /results
