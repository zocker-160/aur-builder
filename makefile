prepare:
	docker build . --pull --no-cache --tag=makepkg
	mkdir build
barrier:
	docker run --rm --name builder --user builder --net host -v $(PWD)/build:/results makepkg barrier
