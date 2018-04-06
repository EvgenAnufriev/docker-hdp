#!/bin/bash

export OS_VER=7
export AMBARI_VER=2.6.1.5
export HDP_VER=2.6.4.0
export HDP_UTILS_VER=1.1.0.22

export HDP_STACK=${HDP_VER:0:3}
export AMBARI_STACK=${AMBARI_VER:0:3}

export AMBARI_HOST=localhost:8080
export REPO_HOST_ADDRESS=repo-cache.dev
export REPO_HOST_ADDRESS_LOCAL=$REPO_HOST_ADDRESS:8085
export BASE_URL=http://${REPO_HOST_ADDRESS}/HDP/centos$OS_VER/2.x/updates/$HDP_VER

#export AMBARI_DDL_URL=https://raw.githubusercontent.com/apache/ambari/branch-${AMBARI_STACK}/ambari-server/src/main/resources/Ambari-DDL-Postgres-CREATE.sql
export AMBARI_DDL_URL=http://${REPO_HOST_ADDRESS_LOCAL}/ambari/${OS_VER}/sql/Ambari-DDL-Postgres-CREATE.sql

export AMBARI_REPO_URL=http://${REPO_HOST_ADDRESS}/ambari.repo
export HDP_REPO_URL=http://${REPO_HOST_ADDRESS}/hdp.repo

MyIP="$(ip a show dev docker0 | grep -w inet | awk -F' ' {'print $2'} | awk -F'/' {'print $1'})"

export AMBARI_REPO_URL_BUILD=http://${MyIP}/ambari.repo
export HDP_REPO_URL_BUILD=http://${MyIP}/hdp.repo


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
echo REPO_HOST_ADDRESS_LOCAL=$REPO_HOST_ADDRESS_LOCAL
echo AMBARI_REPO_URL_BUILD=$AMBARI_REPO_URL_BUILD
echo HDP_REPO_URL_BUILD=$HDP_REPO_URL_BUILD    
echo
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
echo    

# docker-compose build-args
#AMBARI_DDL_URL=https://raw.githubusercontent.com/apache/ambari/branch-2.5/ambari-server/src/main/resources/Ambari-DDL-Postgres-CREATE.sql
#AMBARI_REPO_URL=http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.5.2.0/ambari.repo
#HDP_REPO_URL=http://public-repo-1.hortonworks.com/HDP/centos7/2.x/updates/2.6.2.0/hdp.repo
