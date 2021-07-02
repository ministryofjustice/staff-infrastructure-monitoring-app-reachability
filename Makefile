#!make
include .env
export

build:
	./build.sh

run:
	docker run -it -e PROM_USER=$$PROM_USER -e PROM_PASS=$$PROM_PASS -e PROM_TARGET=$$PROM_TARGET -e REMOTE_WRITE_URL=$$REMOTE_WRITE_URL app-reachability:latest

.PHONY: build run