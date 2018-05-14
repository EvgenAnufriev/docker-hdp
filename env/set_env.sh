#!/bin/bash

export OS_VER=7
export AMBARI_VER=2.6.1.5
export HDP_VER=2.6.4.0
export HDP_UTILS_VER=1.1.0.22

export HDP_STACK=${HDP_VER:0:3}
export AMBARI_STACK=${AMBARI_VER:0:3}

export AMBARI_HOST=localhost:8080

export HDP_COMPOSE_FILE=compose/multy-container.yml
export HDP_REPO_NODE_COMPOSE_FILE=compose/repo-cache.yml


#export BASE_URL=http://${REPO_HOST_ADDRESS}/HDP/centos$OS_VER/2.x/updates/$HDP_VER
#baseurl=http://$REPO_HOST_ADDRESS/hdp/${OS_VER}/HDP-UTILS-${HDP_UTILS_VER}

# Variables used while containers run
export REPO_HOST_ADDRESS=repo-cache.dev
export AMBARI_REPO_URL=http://${REPO_HOST_ADDRESS}/ambari.repo
export HDP_REPO_URL=http://${REPO_HOST_ADDRESS}/hdp.repo


#Varibale used while building images
## If host is CentOS/Linux
#MyIP="$(ip a show dev docker0 | grep -w inet | awk -F' ' {'print $2'} | awk -F'/' {'print $1'})"

#if host is Mac
MyIP="$(ip addr show dev en4 | grep -w inet | awk -F' ' {'print $2'} | awk -F'/' {'print $1'})"
export REPO_HOST_ADDRESS_GLOBAL=${MyIP}:8085

export AMBARI_REPO_URL_BUILD=http://${REPO_HOST_ADDRESS_GLOBAL}/ambari_build.repo
export HDP_REPO_URL_BUILD=http://${REPO_HOST_ADDRESS_GLOBAL}/hdp_build.repo
export AMBARI_REPO_URL_RUN=http://${REPO_HOST_ADDRESS_GLOBAL}/ambari.repo
export HDP_REPO_URL_RUN=http://${REPO_HOST_ADDRESS_GLOBAL}/hdp.repo
export AMBARI_DDL_URL=http://${REPO_HOST_ADDRESS_GLOBAL}/ambari/${OS_VER}/sql/Ambari-DDL-Postgres-CREATE.sql

export AMBARI_VDF_REPO_URL_RUN=http://${REPO_HOST_ADDRESS_GLOBAL}/AMBARI-VDF.xml

echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
echo 
echo Environment settings
echo 
echo OS_VER=$OS_VER
echo AMBARI_VER=$AMBARI_VER
echo HDP_VER=$HDP_VER
echo HDP_UTILS_VER=$HDP_UTILS_VER
echo HDP_STACK=$HDP_STACK
echo AMBARI_STACK=$AMBARI_STACK
echo AMBARI_HOST=$AMBARI_HOST
echo BASE_URL=$BASE_URL
echo AMBARI_DDL_URL=$AMBARI_DDL_URL    
echo AMBARI_REPO_URL=$AMBARI_REPO_URL
echo HDP_REPO_URL=$HDP_REPO_URL
echo REPO_HOST_ADDRESS_GLOBAL=$REPO_HOST_ADDRESS_GLOBAL
echo AMBARI_REPO_URL_BUILD=$AMBARI_REPO_URL_BUILD
echo HDP_REPO_URL_BUILD=$HDP_REPO_URL_BUILD    
echo
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
echo    




