#!/bin/bash

source ./env/set_env.sh

export BASEURL=http://$REPO_HOST_ADDRESS/hdp/${OS_VER}/HDP-${HDP_VER}
export BLUEPRINT=blueprints/HDP.json
export HOST_GROUPS=hostgroups/multi-container.json

#docker-compose -f $HDP_COMPOSE_FILE up --detach --remove-orphans

#sleep 60

echo BLUEPRINT =$BLUEPRINT 
curl --user admin:admin -H 'X-Requested-By:admin' -X POST $AMBARI_HOST/api/v1/blueprints/HDP --data-binary "@$BLUEPRINT"
echo BLUEPRINT DONE

echo BASEURL=$BASEURL
curl --user admin:admin -H 'X-Requested-By:admin' -X PUT $AMBARI_HOST/api/v1/stacks/HDP/versions/$HDP_STACK/operating_systems/$OS_VER/repositories/HDP-${HDP_STACK} -d '{"Repositories":{"base_url":"'$BASE_URL'", "verify_base_url":true}}'
echo BASEURL DONE

echo HOST_GROUPS=$HOST_GROUPS
curl --user admin:admin -H 'X-Requested-By:admin' -X POST $AMBARI_HOST/api/v1/clusters/dev --data-binary "@$HOST_GROUPS"
echo HOST_GROUPS DONE