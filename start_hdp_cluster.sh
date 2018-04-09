#!/bin/bash

source ./env/set_env.sh

HDP_SINGLE_NODE_COMPOSE_FILE=compose/single-container.yml
HDP_REPO_NODE_COMPOSE_FILE=compose/repo-cache.yml

docker-compose -f $HDP_SINGLE_NODE_COMPOSE_FILE up --detach --remove-orphans
