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