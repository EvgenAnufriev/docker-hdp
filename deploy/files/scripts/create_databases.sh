#!/bin/bash

if [ "$1" != "" ]; then
    iterator=$1
else
    iterator=1
fi


for ((i=1; i<=$iterator; i++))
do
    dbName="regression_$i"
    echo [INFO] Deploy $dbName
    beeline --silent=true -u "'jdbc:hive2://localhost:10000/'" -n hive -p "" -e "DROP DATABASE IF EXISTS $dbName CASCADE; CREATE DATABASE $dbName;"
    beeline --silent=true -u "'jdbc:hive2://localhost:10000/$dbName'" -n hive -p "" -f /tmp/files/sql/adf_deploy.sql &> /tmp/files/hive_out/$dbName.log
done