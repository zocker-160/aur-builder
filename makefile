prepare:
	docker build . --pull --no-cache --tag=makepkg
build:
	docker run --name builder --user builder -v $(PWD)/pack:/builder makepkg
clean:
	docker rm builder
	mv ./pack/*.pkg.tar.xz .
	rm -rf ./pack
