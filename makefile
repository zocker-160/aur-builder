build:
	docker build . --pull --no-cache --tag=makepkg
run:
	docker run -it --name builder --user builder --cpus "12"  -v "$(PWD)"/tmp:/builder makepkg
clean:
	docker rm builder
