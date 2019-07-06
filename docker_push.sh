#!/bin/bash -v

docker images

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push "$DOCKER_USERNAME"/docker-gerrit
docker push "$DOCKER_USERNAME"/docker-gerrit-ubuntu