FROM centos:7
ARG AMBARI_REPO_URL_BUILD
ARG HDP_REPO_URL_BUILD
ARG AMBARI_REPO_URL_RUN
ARG HDP_REPO_URL_RUN

RUN yum install -y sudo wget openssl-devel postgresql-jdbc mysql-connector-java unzip

RUN wget -nv ${AMBARI_REPO_URL_BUILD} -O /etc/yum.repos.d/ambari_build.repo && \
  wget -nv ${HDP_REPO_URL_BUILD} -O /etc/yum.repos.d/hdp_build.repo 


## Uncomment if you want to run kerberos in container
## RUN yum install -y krb5-server krb5-libs krb5-workstation
RUN yum install -y ambari-agent
#RUN yum install -y ambari-metrics-*
#RUN yum install -y ambari-logsearch-*
#RUN yum install -y hadoop*
#RUN yum install -y zookeeper*
#RUN yum install -y hive*
#RUN yum install -y phoenix_*
#RUN yum install -y ranger*
#RUN yum install -y storm_*
#RUN yum install -y kafka_*
#RUN yum install -y pig_*
#RUN yum install -y datafu_*
#RUN yum install -y spark* livy*
#RUN yum install -y zeppelin*
#RUN yum install -y falcon_*
#RUN yum install -y oozie_*
##RUN yum install -y lucidworks-hdpsearch
#RUN yum install -y smartsense*
#RUN yum install -y druid*
#RUN yum install -y superset*

RUN rm -f /etc/yum.repos.d/ambari_build.repo && \
 rm -f /etc/yum.repos.d/hdp_build.repo

RUN yum install -y lzo snappy-devel rpcbind

RUN wget -nv ${AMBARI_REPO_URL_RUN} -O /etc/yum.repos.d/ambari.repo && \
  wget -nv ${HDP_REPO_URL_RUN} -O /etc/yum.repos.d/hdp.repo

ADD scripts/start.sh /start.sh
CMD /start.sh
