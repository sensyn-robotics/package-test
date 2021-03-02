include .env

.DEFAULT_GOAL := build_local

build_local:
	GITHUB_TOKEN=$(GITHUB_TOKEN) docker-compose build
