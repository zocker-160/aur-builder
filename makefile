prepare:
	docker build . --pull --no-cache --tag=makepkg
build:
	docker run --name builder --user builder -v $(PWD)/pack:/builder makepkg
clean:
	docker rm builder
	mkdir build
	mv ./pack/*.pkg.tar.* ./build
