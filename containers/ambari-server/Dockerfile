FROM centos:7
ARG AMBARI_REPO_URL_BUILD
ARG HDP_REPO_URL_BUILD

RUN yum install -y wget sudo net-tools

RUN echo AMBARI_REPO_URL_BUILD=${AMBARI_REPO_URL_BUILD} &&\
echo OS_VER=$OS_VER

RUN wget -nv ${AMBARI_REPO_URL_BUILD} -O /etc/yum.repos.d/ambari.repo
RUN wget -nv ${HDP_REPO_URL_BUILD} -O /etc/yum.repos.d/hdp.repo

RUN yum install -y sudo wget openssl-devel postgresql-jdbc mysql-connector-java unzip


RUN yum install -y ambari-server postgresql-jdbc
RUN ambari-server setup --database=postgres --databasehost=postgres.dev --databaseport=5432 --databasename=ambari --postgresschema=ambari  --databaseusername=ambari --databasepassword=dev --silent
RUN ambari-server setup --jdbc-db postgres --jdbc-driver=/usr/share/java/postgresql-jdbc.jar
ADD scripts/start.sh /start.sh
CMD /start.sh
