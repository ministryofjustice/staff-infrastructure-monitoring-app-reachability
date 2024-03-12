#!make
ifneq (,$(wildcard ./.env))
	include .env
endif
export

.DEFAULT_GOAL := help

.PHONY: build
build: ## Get blackbox_exporter image from GitHub and build
	./build.sh

.PHONY: run
run: ## Get blackbox_exporter image from GitHub, build and run against target in .env
	$(MAKE) build
	docker run -it -e PROM_USER=$$PROM_USER -e PROM_PASS=$$PROM_PASS -e PROM_TARGET=$$PROM_TARGET -e REMOTE_WRITE_URL=$$REMOTE_WRITE_URL app-reachability:latest

help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
