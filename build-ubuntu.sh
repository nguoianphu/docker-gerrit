#!/bin/bash -v

cd ubuntu/$UBUNTU_VERSION/

docker build -t ${DOCKER_USERNAME}/docker-gerrit-ubuntu .
docker images
docker run --name my-docker-gerrit -d -p 8080:8080 -p 29418:29418 ${DOCKER_USERNAME}/docker-gerrit-ubuntu
docker ps -a
docker exec -it my-docker-gerrit ps -ef
docker logs my-docker-gerrit
curl http://localhost:8080
docker stop my-docker-gerrit || true

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push "$DOCKER_USERNAME"/docker-gerrit-ubuntu