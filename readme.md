# Docker container to build AUR and PKGBUILD packages

#### prepare container

```bash
git clone https://github.com/zocker-160/aur-builder.git
cd aur-builder
make arch
# for Manjaro
make manjaro
```

##### or pull prebuild container from docker hub

```bash
docker pull zocker160/aur-builder:latest
# or if you want to have a manjaro base
docker pull zocker160/aur-builder:manjaro
```

#### build AUR package

```bash
# if you have build the container using the make command
bash zlocal.sh <name_of_AUR_package>
# if you want to use prebuild container
## Arch
bash zhub.sh <name_of_AUR_package>
## Manjaro
bash zhubManjaro.sh <name_of_AUR_package>
```

#### build own / local PKGBUILD (not from AUR)

```bash
mkdir build
# if you have build the container using the make command
docker run -it --name builder --user builder --net host -v $(pwd)/build:/results --entrypoint bash makepkg
# if you want to use prebuild container
## Arch
docker run -it --name builder --user builder --net host -v $(pwd)/build:/results --entrypoint bash zocker160/aur-builder:latest
## Manjaro
docker run -it --name builder --user builder --net host -v $(pwd)/build:/results --entrypoint bash zocker160/aur-builder:manjaro
### inside the docker container
cd ~
# do whatever you want to prepare/pull/copy the PKGBUILD file
zabuilder.sh # this builds the PKGBUILD inside the current folder + generates a log file + moves it to /results
```

If successful you should see a `.pkg` and a `.log` file.

If you have any issues, feel free to create a new issue on github: [Issues · zocker-160/aur-builder · GitHub](https://github.com/zocker-160/aur-builder/issues)
