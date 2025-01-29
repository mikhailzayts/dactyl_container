build: Dockerfile
	docker build --tag mikhailzayts/dactyl .

run:
	docker run --rm -it mikhailzayts/dactyl
