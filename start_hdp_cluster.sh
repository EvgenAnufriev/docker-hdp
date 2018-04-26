#!/bin/bash


source ./env/set_env.sh

set -x

export BASE_URL_REPO=http://$REPO_HOST_ADDRESS/hdp/${OS_VER}/HDP-${HDP_VER}
export BASE_UTILS_URL_REPO=http://$REPO_HOST_ADDRESS/hdp/${OS_VER}/HDP-UTILS-${HDP_UTILS_VER}

#export Ambari_VDF=/hdp/${OS_VER}/HDP-${HDP_VER}/HDP-${HDP_VER}-91.xml


export BLUEPRINT=blueprints/HDP.json
export HOST_GROUPS=hostgroups/multi-container.json

#export BASEURL_JSON='{"Repositories":{"repo_name":"'${HDP_VER}'","base_url":"'$BASE_URL_REPO'","verify_base_url":true}}'
#export BASEURL_UTILS_JSON='{"Repositories":{"repo_name":"'${HDP_VER}'","base_url":"'$BASE_UTILS_URL_REPO'","verify_base_url":true}}'

docker-compose -f $HDP_COMPOSE_FILE up --detach --remove-orphans

sleep 60

echo REGISTER VDF
curl --user admin:admin -H "X-Requested-By:admin" -X POST $AMBARI_HOST/api/v1/version_definitions -d '{"VersionDefinition":{"version_url": "file:/tmp/AMBARI-VDF.xml"}}'
echo REGISTER VDF DONE

echo BLUEPRINT =$BLUEPRINT 
curl --user admin:admin -H 'X-Requested-By:admin' -X POST $AMBARI_HOST/api/v1/blueprints/HDP --data-binary "@$BLUEPRINT"
echo BLUEPRINT DONE

#echo BASE_URL_REPO=$BASE_URL_REPO
#echo BASE_UTILS_URL_REPO=$BASE_UTILS_URL_REPO
#curl --user admin:admin -H 'X-Requested-By:admin' -X PUT $AMBARI_HOST/api/v1/stacks/HDP/versions/$HDP_STACK/operating_systems/redhat$OS_VER/repositories/HDP-${HDP_STACK} -d $BASEURL_JSON
#curl --user admin:admin -H 'X-Requested-By:admin' -X PUT $AMBARI_HOST/api/v1/stacks/HDP/versions/$HDP_STACK/operating_systems/redhat$OS_VER/repositories/HDP-${HDP_UTILS_VER} -d $BASEURL_UTILS_JSON
#echo BASE_URL_REPO DONE


echo HOST_GROUPS=$HOST_GROUPS
curl --user admin:admin -H 'X-Requested-By:admin' -X POST $AMBARI_HOST/api/v1/clusters/dev --data-binary "@$HOST_GROUPS"
echo HOST_GROUPS DONE



#curl --user admin:admin -H 'X-Requested-By:admin' -X PUT http://localhost:8080/api/v1/stacks/HDP/versions/2.6/operating_systems/redhat7/repositories/HDP-2.6 -d '{"Repositories":{"repo_name": "HDP-2.6.4.0", "base_url":"'http://repo-cache.dev/hdp/7/HDP-2.6.4.0'", "verify_base_url":true}}'
