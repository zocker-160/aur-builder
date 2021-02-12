prepare:
	docker build . -f Dockerfile --pull --no-cache -t makepkg
manjaro:
	docker build . -f Dockerfile.manjaro --pull --no-cache -t makepkg
barrier:
	#docker run --rm --name builder --user builder --net host -v $(PWD)/build:/results makepkg barrier
	docker run --name builder --user builder --net host makepkg barrier-git
	docker cp builder:/results .
	docker rm builder
scrcpy:
	#docker run --rm --name builder --user builder --net host -v $(PWD)/build:/results makepkg barrier
	docker run --name builder --user builder --net host makepkg scrcpy
	docker cp builder:/results .
	docker rm builder
