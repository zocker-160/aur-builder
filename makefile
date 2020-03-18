prepare:
	docker build . --pull --no-cache --tag=makepkg
build:
	docker run -it --name builder --user builder -v "$(PWD)":/builder makepkg
clean:
	docker rm builder
