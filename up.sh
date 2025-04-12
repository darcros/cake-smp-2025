#/bin/bash
set -euo pipefail

DOCKER_CONTAINER_USER=1000
DOCKER_CONTAINER_GROUP=1000

mkdir -p ./data/smp/universe; chown $DOCKER_CONTAINER_USER:$DOCKER_CONTAINER_GROUP ./data/smp/universe
mkdir -p ./data/smp/databases; chown $DOCKER_CONTAINER_USER:$DOCKER_CONTAINER_GROUP ./data/smp/databases
mkdir -p ./data/smp/logs; chown $DOCKER_CONTAINER_USER:$DOCKER_CONTAINER_GROUP ./data/smp/logs

docker compose up --build
