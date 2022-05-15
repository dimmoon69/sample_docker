THIS_FILE := $(lastword $(MAKEFILE_LIST))
.PHONY: help build up stop restart  destroy log shell manage makemigrations migrate test

help:
	make -pRrq  -f $(THIS_FILE) : 2>/dev/null |	awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

build:
	docker-compose -f docker-compose.yml build $(c)
build.dev:
	docker-compose -f docker-compose.dev.yml build $(c)

up:
	docker-compose -f docker-compose.yml up -d $(c)
up.dev:
	docker-compose -f docker-compose.dev.yml up -d $(c)

stop:
	docker-compose -f docker-compose.yml stop $(c)
stop.dev:
	docker-compose -f docker-compose.dev.yml stop $(c)

restart:
	docker-compose -f docker-compose.yml stop $(c)
	docker-compose -f docker-compose.yml up -d $(c)
restart.dev:
	docker-compose -f docker-compose.dev.yml stop $(c)
	docker-compose -f docker-compose.dev.yml up -d $(c)

destroy:
	docker-compose -f docker-compose.dev.yml down -v $(c)

log:
	docker-compose -f docker-compose.dev.yml logs --tail=150 -f sample-web

shell:
	docker-compose -f docker-compose.dev.yml exec sample-web /bin/bash

manage:
	docker-compose -f docker-compose.dev.yml exec sample-web python manage.py $(c)

makemigrations:
	docker-compose -f docker-compose.dev.yml exec sample-web python manage.py makemigrations

migrate:
	docker-compose -f docker-compose.dev.yml exec sample-web python manage.py migrate

test:
	docker-compose -f docker-compose.dev.yml exec sample-web python manage.py test