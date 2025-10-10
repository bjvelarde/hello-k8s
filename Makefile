# Makefile

build:
	docker build -t bvelarde/hello-k8s:latest ./app

push:
	docker push bvelarde/hello-k8s:latest

deploy:
	cd terraform && terraform apply -auto-approve

all: build push deploy
