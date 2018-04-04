#!/bin/bash

source ./env/set_env.sh
docker-compose -f containers/repo-cache/repo-cache.yml build $1