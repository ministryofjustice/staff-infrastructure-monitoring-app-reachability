#!make
include .env
export

build:
	./build.sh

run:
	docker run -it -e IMA_USER=$$IMA_USER -e IMA_PASS=$$IMA_PASS -e IMA_TARGET=$$IMA_TARGET -e IMAP_PROMETHEUS_URL=$$IMAP_PROMETHEUS_URL app-reachability:latest

.PHONY: build run