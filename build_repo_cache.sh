#!/bin/bash

source ./env/set_env.sh
docker-compose -f compose/repo-cache.yml build $1