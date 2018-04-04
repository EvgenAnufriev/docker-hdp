#!/bin/bash
set -e


echo !!!!!!!!!!!;
echo REPO_HOST_ADDRESS=$REPO_HOST_ADDRESS
#./wait-for-it.sh ${REPO_HOST_ADDRESS}:8085

cd ~/
#wget https://raw.githubusercontent.com/apache/ambari/branch-2.5/ambari-server/src/main/resources/Ambari-DDL-Postgres-CREATE.sql
echo AMBARI_DDL_URL=$AMBARI_DDL_URL

 wget -nv ${AMBARI_DDL_URL} -O Ambari-DDL-Postgres-CREATE.sql

 cat Ambari-DDL-Postgres-CREATE.sql
# #sed -i "s/\${ambariSchemaVersion}/2.5.2/g" Ambari-DDL-Postgres-CREATE.sql

# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
#     create database ambari;
#     create user ambari with password 'dev';
#     GRANT ALL PRIVILEGES ON DATABASE ambari TO ambari;

#     CREATE SCHEMA ambari AUTHORIZATION ambari;
#     ALTER SCHEMA ambari OWNER TO ambari;
#     ALTER SCHEMA public OWNER to ambari;

#     ALTER ROLE ambari SET search_path to 'ambari', 'public';

#     \connect ambari ambari;
#     \i Ambari-DDL-Postgres-CREATE.sql 
# EOSQL

# cp /pg_hba.conf /var/lib/postgresql/data/
