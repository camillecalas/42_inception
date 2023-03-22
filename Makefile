include ./srcs/.env

all:
	mkdir -p ${DATA_FOLDER}/mariadb
	mkdir -p ${DATA_FOLDER}/wordpress
	sudo docker compose -f ./srcs/docker-compose.yml up -d

up:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

down:
	sudo docker compose -f ./srcs/docker-compose.yml down -v

clean: down
	sudo docker image -rm --force nginx wordpress mariadb

cleandb: down
	sudo docker container	prune --force
	sudo docker image 		prune --all --force
	sudo docker network 	prune --force
	sudo docker volume 		prune --force
	sudo docker system 		prune --force


fclean: down
	sudo docker container	prune --force
	sudo docker image 		prune --all --force
	sudo docker network 	prune --force
	sudo docker volume 		prune --force
	sudo docker system 		prune --force
	sudo rm -rf ${DATA_FOLDER}

re: fclean all


# include ./srcs/.env

# all:
# 	sudo mkdir -p ${DATA_FOLDER}/wordpress
# 	sudo mkdir -p ${DATA_FOLDER}/mariadb
# 	docker compose -f ./srcs/docker-compose.yml up -d
# 	docker compose -f ./srcs/docker-compose.yml ps

# up:
# 	docker compose -f ./srcs/docker-compose.yml up -d
# 	docker compose -f ./srcs/docker-compose.yml ps

# re: fclean all

# #stops and removes containers, networks, volumes and images created by up
# down:
# 	docker compose -f ./srcs/docker-compose.yml down

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