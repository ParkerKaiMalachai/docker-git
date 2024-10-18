ENV ?= dev
DOCKER_COMPOSE = docker-compose.$(ENV).yaml

create:
	docker run --rm \
	-v main-volume:/data \
	-v restore-volume:/backup \
	alpine \
	sh -c "tar cvf /backup/backup.tar -C /data ."

restore:
	docker run --rm \
	-v main-volume:/data \
	-v restore-volume:/backup \
	alpine \
	sh -c "tar xvf /backup/backup.tar -C /data"



build:
	docker compose -f $(DOCKER_COMPOSE) up --build
start: 
	docker compose -f $(DOCKER_COMPOSE) up -d
down:
	docker compose -f $(DOCKER_COMPOSE) down
