#! /bin/bash

# Install all dependencies
echo "INFO: installing all missing dependencies..."
makepkg --printsrcinfo > SINFO
while read -r -u 9 key value;
do
    if [ "$key" == "makedepends" ];
    then
        DEP=$(echo "$value" | cut -d ' ' -f2 | cut -d '>' -f1)
        echo "installing $DEP..."
        yay --needed --noconfirm --removemake -S "$DEP"
    fi
done 9< "SINFO"

echo "found $(nproc) cores"
makepkg -s -c -C -f --noconfirm --noprogressbar | tee ~/$1-build.log
cp ./*.pkg.tar.* /results
cp ~/$1-build.log /results
