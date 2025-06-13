# Containers.Tools

Various scripts for setting-up a container for the specified service.

Support for Docker and Podman.

## Docker Networking

### Between Docker containers

#### Using Docker Networks

Create a custom network using docker network create mynetwork.
Add both containers (let’s call them containerA and containerB) to this network: docker network connect mynetwork containerA.
Now, you can refer to containerB from containerA using its name (e.g., http://containerB:8080/myserver).

#### Using the Special DNS Name

Docker provides a special DNS name called host.docker.internal.
From within a container, you can use this DNS name to access services running on your host machine.
For example, if you’re running a web service on port 3000 on your host, you can access it from a container using http://host.docker.internal:3000.

### From host machine to docker

Use the IP address of the docker container.
