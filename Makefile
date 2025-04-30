
DOCKER_COMPOSE = docker compose -f ./src/docker-compose.yml
# DOCKER_COMPOSE = docker-compose -f ./src/docker-compose.yml


all: build up

build:
	@if [ -z "$$(docker ps -q)" ] ; then \
		mkdir -p /Users/timschmi/Desktop/Inception/src/db; \
		mkdir -p /Users/timschmi/Desktop/Inception/src/web; \
		$(DOCKER_COMPOSE) build; \
	else \
		echo "Containers already built\n"; \
	fi 

up:
	$(DOCKER_COMPOSE) up; \

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

clean: removeall
	docker system prune -a --volumes
	rm -rf /Users/timschmi/Desktop/Inception/src/web/
	rm -rf /Users/timschmi/Desktop/Inception/src/db/

# rm -rf src/web src/db

.PHONY: all build up down removeall down-v clean
		
		
		
# mkdir -p /home/timschmi/Desktop/Inception/src/db; 
# mkdir -p /home/timschmi/Desktop/Inception/src/web; 