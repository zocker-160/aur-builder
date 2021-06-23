# Docker container to build AUR and PKGBUILD packages

#### prepare container

## Quickstart

```bash
mkdir build
# Archlinux
docker run --rm --name builder --user builder --net host -v $(pwd)/build:/results zocker160/aur-builder:latest <name_of_AUR_package>
# Manjaro
docker run --rm --name builder --user builder --net host -v $(pwd)/build:/results zocker160/aur-builder:manjaro <name_of_AUR_package>
```

## Using build scripts
```bash
git clone https://github.com/zocker-160/aur-builder.git
cd aur-builder

# if you want to use prebuild container
## Archlinux
bash zhub.sh <name_of_AUR_package>
## Manjaro
bash zhubManjaro.sh <name_of_AUR_package>

# if you want to build the container yourself
## Archlinux
make arch
## Manjaro
make manjaro

bash zlocal.sh <name_of_AUR_package>
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
