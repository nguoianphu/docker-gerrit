#!/bin/bash -v

cd centos/$CENTOS_VERSION/

docker build -t docker-gerrit .
docker images
nohup docker run --name my-docker-gerrit -p 8080:8080 -p 29418:29418 docker-gerrit &
echo "Wait a few minutes until the Gerrit Code Review NNN ready message appears"
docker ps -a
docker exec -it my-docker-gerrit ps -ef
docker logs my-docker-gerrit
docker stop my-docker-gerrit || true