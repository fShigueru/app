SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
SERVICE := docker exec hackapi_app sh -c
PHP_BASH := docker exec -i -t ${PROJECT_NAME} bash
PROJECT_PATH := /src
PROJECT_NAME := hackapi_app
##
## ----------------------------------------------------------------------------
##   Environment
## ----------------------------------------------------------------------------
##

up: ## up docker-composer
	docker-compose up -d

build: ## Build docker files
	@sh ./init-docker.sh

down: ## down
	docker-compose down

app: ## access php
	docker exec -i -t ${PROJECT_NAME} bash

serve:
	$(SERVICE) "cd /src/ && yarn serve"

install:
	$(SERVICE) "cd /src/ && yarn install"