FROM centos:7
ARG AMBARI_REPO_URL_BUILD
ARG HDP_REPO_URL_BUILD
ARG AMBARI_REPO_URL_RUN
ARG HDP_REPO_URL_RUN
ARG AMBARI_VDF_REPO_URL_RUN

RUN yum install -y wget sudo net-tools

RUN wget -nv ${AMBARI_REPO_URL_BUILD} -O /etc/yum.repos.d/ambari_build.repo && \
  wget -nv ${HDP_REPO_URL_BUILD} -O /etc/yum.repos.d/hdp_build.repo 

RUN yum install -y sudo wget openssl-devel postgresql-jdbc mysql-connector-java unzip


RUN yum install -y ambari-server postgresql-jdbc
RUN ambari-server setup --database=postgres --databasehost=postgres.dev --databaseport=5432 --databasename=ambari --postgresschema=ambari  --databaseusername=ambari --databasepassword=dev --silent
RUN ambari-server setup --jdbc-db postgres --jdbc-driver=/usr/share/java/postgresql-jdbc.jar
ADD scripts/start.sh /start.sh

RUN rm -f /etc/yum.repos.d/ambari_build.repo && \
 rm -f /etc/yum.repos.d/hdp_build.repo

RUN wget -nv ${AMBARI_REPO_URL_RUN} -O /etc/yum.repos.d/ambari.repo && \
  wget -nv ${HDP_REPO_URL_RUN} -O /etc/yum.repos.d/hdp.repo && \
  wget -nv ${AMBARI_VDF_REPO_URL_RUN} -O /tmp/AMBARI-VDF.xml

COPY ../../deploy /tmp

CMD /start.sh
