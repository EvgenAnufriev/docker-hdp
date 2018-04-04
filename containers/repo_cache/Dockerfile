FROM centos/httpd

ARG OS_VER
ARG AMBARI_VER
ARG HDP_VER
ARG HDP_UTILS_VER
ARG AMBARI_STACK

RUN echo AMBARI_STACK=${AMBARI_STACK} && \
echo HDP_VER=${HDP_VER}

RUN  yum install -y yum-utils createrepo wget

ENV AMBARI_REPO_URL=http://public-repo-1.hortonworks.com/ambari/centos${OS_VER}/2.x/updates/${AMBARI_VER}/ambari.repo
ENV HDP_REPO_URL=http://public-repo-1.hortonworks.com/HDP/centos${OS_VER}/2.x/updates/${HDP_VER}/hdp.repo

RUN mkdir -p /var/www/html/ambari/${OS_VER} && \
mkdir -p /var/www/html/hdp/${OS_VER} && \
mkdir -p /var/www/html/ambari/${OS_VER}/sql

RUN wget -nv ${AMBARI_REPO_URL} -O /etc/yum.repos.d/ambari.repo && \
 wget -nv ${HDP_REPO_URL} -O /etc/yum.repos.d/hdp.repo && \
 wget -nv ${HDP_REPO_URL} -O /etc/yum.repos.d/hdp.repo && \
 wget -nv https://raw.githubusercontent.com/apache/ambari/branch-${AMBARI_STACK}/ambari-server/src/main/resources/Ambari-DDL-Postgres-CREATE.sql -O /var/www/html/ambari/${OS_VER}/sql/Ambari-DDL-Postgres-CREATE.sql

RUN reposync -p /var/www/html/ambari/${OS_VER} -r ambari-${AMBARI_VER} && \
reposync -p /var/www/html/hdp/${OS_VER} -r HDP-${HDP_VER} && \
reposync -p /var/www/html/hdp/${OS_VER} -r HDP-UTILS-${HDP_UTILS_VER} && \
createrepo /var/www/html/ambari/${OS_VER}/ambari-${AMBARI_VER} && \
createrepo /var/www/html/hdp/${OS_VER}/HDP-${HDP_VER} && \
createrepo /var/www/html/hdp/${OS_VER}/HDP-UTILS-${HDP_UTILS_VER}
