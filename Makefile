include ./srcs/.env

all:
	mkdir -p ${DATA_FOLDER}/mariadb
	mkdir -p ${DATA_FOLDER}/wordpress
	docker compose -f ./srcs/docker-compose.yml up -d

up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down -v

clean: down
	docker image -rm --force nginx wordpress mariadb

fclean: down
	docker container	prune --force
	docker image 		prune --all --force
	docker network 		prune --force
	docker volume 		prune --force
	docker system 		prune --force
	sudo rm -rf ${DATA_FOLDER}

re: fclean all

# all:
# 	sudo mkdir -p ${DATA_FOLDER}/wordpress_files
# 	sudo mkdir -p ${DATA_FOLDER}/wordpress_database
# 	docker compose -f ./srcs/docker-compose.yml up -d
# 	docker compose -f ./srcs/docker-compose.yml ps

# up:
# 	docker compose -f ./srcs/docker-compose.yml up -d
# 	docker compose -f ./srcs/docker-compose.yml ps

# re: fclean all

# #stops and removes containers, networks, volumes and images created by up
# down:
# 	docker compose -f ./srcs/compose.yaml down

# stop_all:
# 	-docker stop `docker ps -aq`

# cclean:
# 	-docker rm -f `docker ps -aq`

# iclean:
# 	-docker rmi -f `docker images -aq`

# vclean:
# 	-docker volume rm `docker volume ls -q`

# fclean: stop_all cclean iclean vclean 
# 	docker system prune -af --volumes
# 	sudo rm -rf ${DATA_FOLDER}

