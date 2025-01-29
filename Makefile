tag := mikhailzayts/dactyl
dir := ./src
container_dir := /home/ubuntu/src

build: Dockerfile
	docker build --tag $(tag) .

run: build
	docker run --rm -it --volume $(dir):$(container_dir) $(tag)
