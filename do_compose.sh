#!/bin/bash

COMPOSEFILE=$1
CMD=$2

source ./env/set_env.sh

docker-compose -f $COMPOSEFILE $CMD $3