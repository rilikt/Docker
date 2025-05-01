DOCKER_COMPOSE = docker-compose -f ./src/docker-compose.yml

all: build up

build:
	@if [ -z "$$(docker ps -q)" ] ; then \
		$(DOCKER_COMPOSE) build; \
	else \
		echo "Containers already built\n"; \
	fi 

up:
	$(DOCKER_COMPOSE) up; \

createdir:
		@mkdir -p /home/timschmi/data/db;
		@mkdir -p /home/timschmi/data/web;

down:
	$(DOCKER_COMPOSE) down; \

down-v:
	$(DOCKER_COMPOSE) down -v; \

removeall:
	@if [ -n "$$(docker ps -qa)" ]; then docker stop $$(docker ps -qa); fi
	@if [ -n "$$(docker ps -qa)" ]; then docker rm $$(docker ps -qa); fi
	@if [ -n "$$(docker images -qa)" ]; then docker rmi -f $$(docker images -qa); fi
	@if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q); fi
	@if [ -n "$$(docker network ls -q)" ]; then docker network rm $$(docker network ls -q) 2>/dev/null || true; fi

fclean: removeall
	docker system prune -a --volumes
	sudo rm -rf /home/timschmi/web/
	sudo rm -rf /home/timschmi/db/

.PHONY: all build up down removeall down-v clean
