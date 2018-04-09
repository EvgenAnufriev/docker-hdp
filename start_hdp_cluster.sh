#!/bin/bash

source ./env/set_env.sh

docker-compose -f $HDP_SINGLE_NODE_COMPOSE_FILE up --detach --remove-orphans
