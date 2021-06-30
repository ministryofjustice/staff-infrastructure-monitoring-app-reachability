#!make
include .env
export

build:
	./build.sh

run:
	docker run -it -e IMA_USER=$$IMA_USER -e IMA_PASS=$$IMA_PASS -e IMA_TARGET=$$IMA_TARGET app-reachability:latest

.PHONY: build run