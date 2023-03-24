# 42_inception

## the difference between a docker image used with docker-compose or without

The main difference between using a Docker image with or without docker-compose is in how the containers are created and managed.

When you use Docker on its own, you typically use the docker run command to start a container from an image. This creates a single container that runs the application within the image. If you need to run multiple containers for your application, you would need to manually start and manage each one individually.

On the other hand, when you use Docker-compose, you define your application as a set of services, each of which is defined in a separate container. You can then use a single docker-compose up command to start all the containers in the correct order, set up the necessary networks, and configure the required volumes.

With docker-compose, you can also define environment variables, networking options, and volumes for each service in a single configuration file. This makes it easier to manage complex multi-container applications, as you can define all the settings for your application in a single place.

Overall, using Docker images with Docker-compose provides a more streamlined way to manage complex applications and their dependencies. It allows you to define your entire application as a set of services, each running in a separate container, and to manage them all with a single command.




## Docker network

is a feature of Docker that allows containers to communicate with each other and with the outside world. It provides a virtual network interface to each container, allowing them to communicate with each other as if they were connected to the same physical network. Docker network also provides isolation and security features, allowing containers to communicate only with the services they need to, and not exposing unnecessary ports to the outside world.

Docker provides several types of networks out of the box, including bridge networks, host networks, and overlay networks. Bridge networks are the default type and provide connectivity between containers running on the same Docker host. Host networks allow containers to use the host network stack, and overlay networks allow containers to communicate across multiple Docker hosts.

In addition to the built-in network types, Docker also supports custom networks. These allow you to create your own virtual networks with specific settings, such as IP address ranges and subnet masks.

Overall, Docker network is a powerful feature that makes it easy to manage networking between containers and provides a secure and isolated environment for running containerized applications.


##
sudo docker exec -t mariadb bash



mysql -uroot -p root
show databases;
use wordpress
select * from wp_users

# 42_inception_fa
