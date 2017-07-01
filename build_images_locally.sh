#!/usr/bin/env bash

dockerhub_path="eritikass/evekb_docker"

docker build -t ${dockerhub_path}:cron -f Dockerfile-cron . --pull --no-cache
docker build -t ${dockerhub_path}:web -f Dockerfile-web . --pull --no-cache
