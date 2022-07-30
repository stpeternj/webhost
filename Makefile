.PHONY: build create start stop up down
PROJECT_NAME = stpeternj

# Start the containers
start:
	docker compose -p ${PROJECT_NAME} start

stop:
	docker compose -p ${PROJECT_NAME} stop

# Create and start the containers
up:
	docker compose -p ${PROJECT_NAME} up -d

down:
	docker compose -p ${PROJECT_NAME} down

# Create containers from the images
create:
	docker compose -p ${PROJECT_NAME} create

# Build an image for each service in docker-compose.yml
build :
	docker compose -p ${PROJECT_NAME} build --no-cache
