TYPE=$1
BLUEPRINT=$2
source ./.env

curl --user admin:admin -H 'X-Requested-By:admin' -X POST $AMBARI_HOST/api/v1/blueprints/$TYPE --data-binary "@$BLUEPRINT"
curl --user admin:admin -H 'X-Requested-By:admin' -X PUT $AMBARI_HOST/api/v1/stacks/HDP/versions/$HDP_STACK/operating_systems/$OS_VER/repositories/HDP-${HDP_STACK} -d '{"Repositories":{"base_url":"'$BASE_URL'", "verify_base_url":true}}'
curl --user admin:admin -H 'X-Requested-By:admin' -X POST $AMBARI_HOST/api/v1/clusters/dev --data-binary "@hostgroups/$TYPE.json"
