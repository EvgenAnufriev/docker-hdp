#!/bin/bash

source ./env/set_env.sh
docker-compose -f containers/repo_cache/repo_cache.yml build