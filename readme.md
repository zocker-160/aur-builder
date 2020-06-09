# Docker container to build AUR and PKGBUILD packages

#### prepare container

```bash
git clone https://github.com/zocker-160/aur-builder.git
cd aur-builder
make prepare
```

##### or pull from docker hub

```bash
docker pull zocker160/aur-builder:latest
# or if you want to have a manjaro base
docker pull zocker160/aur-builder:manjaro
mkdir build
```

#### build AUR package

```bash
docker run --rm --name builder --user builder --net host -v $(pwd)/build:/results makepkg <name_of_AUR_package>
```

or

```bash
docker run --rm --name builder --user builder --net host -v $(pwd)/build:/results zocker160/aur-builder <name_of_AUR_package>
```

#### build any PKGBUILD

```bash
docker run -it --name builder --user builder --net host -v $(pwd)/build:/results --entrypoint bash zocker160/aur-builder
### inside the docker container
cd ~
# do whatever you want to prepare/pull/copy the PKGBUILD file
zabuilder.sh # this builds the PKGBUILD inside the current folder + generates a log file + moves it to /results
```

if successful you should see a pkg file and a log file inside your `build` folder

if you have any issues, feel free to create a new issue on github: [Issues · zocker-160/aur-builder · GitHub](https://github.com/zocker-160/aur-builder/issues)
