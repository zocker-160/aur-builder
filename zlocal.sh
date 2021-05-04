#! /usr/bin/env bash

if [ -z "$1" ];
then
	echo "pls specify a software name!";
	exit;
fi

echo "Building $1 for Archlinux / Manjaro...."

docker run --name builder --user builder --net host makepkg "$1"
docker cp builder:/results .
docker rm builder

echo "DONE! - look into the results folder for the package files"
