arch:
	docker build . -f Dockerfile --pull --no-cache -t makepkg
manjaro:
	docker build . -f Dockerfile.manjaro --pull --no-cache -t makepkg
test:
	#docker run --rm --name builder --user builder --net host -v $(PWD)/build:/results makepkg hello
	docker run --name builder --user builder --net host makepkg hello
	docker cp builder:/results .
	docker rm builder
cleanup:
	docker stop builder
	docker rm builder
	docker image rm makepkg
