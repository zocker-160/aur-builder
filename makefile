build:
	docker build . --pull --no-cache --tag=makepkg
run:
	docker run -it --name builder --user builder -v "$(PWD)":/builder makepkg
clean:
	docker rm builder
