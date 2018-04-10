FROM postgres:9.4
RUN apt-get update -y && \
 apt-get install -y wget curl
ARG AMBARI_DDL_URL
ARG AMBARI_VER
ADD pg_hba.conf /pg_hba.conf
ADD scripts/* /docker-entrypoint-initdb.d/
RUN mkdir /home/postgres
RUN chown postgres /pg_hba.conf /home/postgres
RUN chown postgres /var/lib/postgresql/data
ADD wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
#RUN wget -nv ${AMBARI_DDL_URL} -O /Ambari-DDL-Postgres-CREATE.sql 
#WORKDIR /
#RUN sed -i "s/\${ambariSchemaVersion}/${AMBARI_VER}/g" /Ambari-DDL-Postgres-CREATE.sql
