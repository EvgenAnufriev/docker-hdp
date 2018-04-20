#!/bin/bash

source ./env/set_env.sh

export BASEURL=http://$REPO_HOST_ADDRESS/hdp/${OS_VER}/HDP-UTILS-${HDP_UTILS_VER}
export BLUEPRINT=blueprints/HDP.json
export HOST_GROUPS=hostgroups/multi-container.json

docker-compose -f $HDP_COMPOSE_FILE up --detach --remove-orphans

curl --user admin:admin -H 'X-Requested-By:admin' -X POST $AMBARI_HOST/api/v1/blueprints/HDP --data-binary "@$BLUEPRINT"
curl --user admin:admin -H 'X-Requested-By:admin' -X PUT $AMBARI_HOST/api/v1/stacks/HDP/versions/$HDP_STACK/operating_systems/$OS_VER/repositories/HDP-${HDP_STACK} -d '{"Repositories":{"base_url":"'$BASE_URL'", "verify_base_url":true}}'
curl --user admin:admin -H 'X-Requested-By:admin' -X POST $AMBARI_HOST/api/v1/clusters/dev --data-binary "@$HOST_GROUPS"
