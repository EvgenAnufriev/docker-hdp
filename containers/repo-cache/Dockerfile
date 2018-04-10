FROM centos/httpd

ARG OS_VER
ARG AMBARI_VER
ARG HDP_VER
ARG HDP_UTILS_VER
ARG AMBARI_STACK
ARG REPO_HOST_ADDRESS_GLOBAL
ARG REPO_HOST_ADDRESS

RUN echo AMBARI_STACK=${AMBARI_STACK} && \
echo HDP_VER=${HDP_VER}

RUN  yum install -y yum-utils createrepo wget

RUN mkdir -p /var/www/html/ambari/${OS_VER} && \
mkdir -p /var/www/html/hdp/${OS_VER} && \
mkdir -p /var/www/html/ambari/${OS_VER}/sql

ENV ORIG_AMBARI_REPO_URL=http://public-repo-1.hortonworks.com/ambari/centos${OS_VER}/2.x/updates/${AMBARI_VER}/ambari.repo
ENV ORIG_HDP_REPO_URL=http://public-repo-1.hortonworks.com/HDP/centos${OS_VER}/2.x/updates/${HDP_VER}/hdp.repo

RUN wget -nv ${ORIG_AMBARI_REPO_URL} -O /etc/yum.repos.d/ambari.repo && \
 wget -nv ${ORIG_HDP_REPO_URL} -O /etc/yum.repos.d/hdp.repo && \
 wget -nv https://raw.githubusercontent.com/apache/ambari/branch-${AMBARI_STACK}/ambari-server/src/main/resources/Ambari-DDL-Postgres-CREATE.sql -O /var/www/html/ambari/${OS_VER}/sql/Ambari-DDL-Postgres-CREATE.sql

RUN reposync -p /var/www/html/ambari/${OS_VER} -r ambari-${AMBARI_VER} && \
reposync -p /var/www/html/hdp/${OS_VER} -r HDP-${HDP_VER} && \
reposync -p /var/www/html/hdp/${OS_VER} -r HDP-UTILS-${HDP_UTILS_VER} && \
createrepo /var/www/html/ambari/${OS_VER}/ambari-${AMBARI_VER} && \
createrepo /var/www/html/hdp/${OS_VER}/HDP-${HDP_VER} && \
createrepo /var/www/html/hdp/${OS_VER}/HDP-UTILS-${HDP_UTILS_VER}

WORKDIR /var/www/html/

# repo files required while building images

# create custom ambari.repo
RUN echo \#VERSION_NUMBER=${AMBARI_VER} >> ambari_build.repo && \
echo [ambari-${AMBARI_VER}] >> ambari_build.repo && \
echo name=ambari Version - ambari-${AMBARI_VER} >> ambari_build.repo && \
echo baseurl=http://$REPO_HOST_ADDRESS_GLOBAL/ambari/${OS_VER}/ambari-${AMBARI_VER} >> ambari_build.repo && \
echo gpgcheck=0 >> ambari_build.repo && \
echo enabled=1 >> ambari_build.repo && \ 
echo priority=1 >> ambari_build.repo


# create custom hdp_build.repo
RUN echo \#VERSION_NUMBER=$HDP_VER >> hdp_build.repo  && \
echo [HDP-$HDP_VER] >> hdp_build.repo  && \
echo name=HDP Version - HDP-$HDP_VER >> hdp_build.repo  && \
echo baseurl=http://$REPO_HOST_ADDRESS_GLOBAL/hdp/${OS_VER}/HDP-${HDP_VER} >> hdp_build.repo  && \
echo gpgcheck=0 >> hdp_build.repo  && \
echo enabled=1 >> hdp_build.repo  && \
echo priority=1 >> hdp_build.repo  && \
echo   >> hdp_build.repo  && \
echo   >> hdp_build.repo  && \
echo [HDP-UTILS-$HDP_UTILS_VER] >> hdp_build.repo  && \
echo name=HDP-UTILS Version - HDP-UTILS-$HDP_UTILS_VER >> hdp_build.repo  && \
echo baseurl=http://$REPO_HOST_ADDRESS_GLOBAL/hdp/${OS_VER}/HDP-UTILS-${HDP_UTILS_VER} >> hdp_build.repo  && \
echo gpgcheck=0 >> hdp_build.repo  && \
echo enabled=1 >> hdp_build.repo  && \
echo priority=1 >> hdp_build.repo



# repo files required while running containers

# create custom ambari.repo
RUN echo \#VERSION_NUMBER=${AMBARI_VER} >> ambari.repo && \
echo [ambari-${AMBARI_VER}] >> ambari.repo && \
echo name=ambari Version - ambari-${AMBARI_VER} >> ambari.repo && \
echo baseurl=http://$REPO_HOST_ADDRESS/ambari/${OS_VER}/ambari-${AMBARI_VER} >> ambari.repo && \
echo gpgcheck=0 >> ambari.repo && \
echo enabled=1 >> ambari.repo && \ 
echo priority=1 >> ambari.repo


# create custom hdp.repo
RUN echo \#VERSION_NUMBER=$HDP_VER >> hdp.repo  && \
echo [HDP-$HDP_VER] >> hdp.repo  && \
echo name=HDP Version - HDP-$HDP_VER >> hdp.repo  && \
echo baseurl=http://$REPO_HOST_ADDRESS/hdp/${OS_VER}/HDP-${HDP_VER} >> hdp.repo  && \
echo gpgcheck=0 >> hdp.repo  && \
echo enabled=1 >> hdp.repo  && \
echo priority=1 >> hdp.repo  && \
echo   >> hdp.repo  && \
echo   >> hdp.repo  && \
echo [HDP-UTILS-$HDP_UTILS_VER] >> hdp.repo  && \
echo name=HDP-UTILS Version - HDP-UTILS-$HDP_UTILS_VER >> hdp.repo  && \
echo baseurl=http://$REPO_HOST_ADDRESS/hdp/${OS_VER}/HDP-UTILS-${HDP_UTILS_VER} >> hdp.repo  && \
echo gpgcheck=0 >> hdp.repo  && \
echo enabled=1 >> hdp.repo  && \
echo priority=1 >> hdp.repo



EXPOSE 80