FROM centos/httpd

ARG HTTP_HOST_ADDRESS
ARG OS_VER
ARG AMBARI_VER
ARG HDP_VER
ARG HDP_UTILS_VER

ARG WEB_REL_REPO_PATH
ARG WEB_REL_ARCH_PATH

ENV AMBARI_REPO_URL=http://public-repo-1.hortonworks.com/ambari/centos${OS_VER}/2.x/updates/${AMBARI_VER}/ambari.repo
ENV HDP_REPO_URL=http://public-repo-1.hortonworks.com/HDP/centos${OS_VER}/2.x/updates/${HDP_VER}/hdp.repo

ENV TMP_WEB_ROOT_PATH=/var/www/html
ENV TMP_WEB_ARCH_PATH=${TMP_WEB_ROOT_PATH}/$WEB_REL_ARCH_PATH
ENV TMP_WEB_REPO_PATH=${TMP_WEB_ROOT_PATH}/$WEB_REL_REPO_PATH

ENV TMP_REL_AMBARI_PATH=AMBARI/centos${OS_VER}/AMBARI-$AMBARI_VER
ENV TMP_REL_HDP_PATH=HDP/centos${OS_VER}/HDP-$HDP_VER
ENV TMP_REL_HDP_UTILS_PATH=HDP-UTILS/centos${OS_VER}/HDP_UTILS-$HDP_UTILS_VER


ENV TMP_FULL_AMBARI_PATH=$TMP_WEB_ROOT_PATH/$TMP_REL_AMBARI_PATH
ENV TMP_FULL_HDP_PATH=$TMP_WEB_ROOT_PATH/$TMP_REL_HDP_PATH
ENV TMP_FULL_HDP_UTILS_PATH=$TMP_WEB_ROOT_PATH/$TMP_REL_HDP_UTILS_PATH

RUN mkdir -p $TMP_FULL_AMBARI_PATH && mkdir -p $TMP_FULL_HDP_PATH && mkdir -p $TMP_FULL_HDP_UTILS_PATH 

WORKDIR $TMP_WEB_REPO_PATH

# create custom ambari.repo
RUN echo \#VERSION_NUMBER=${AMBARI_VER} >> ambari.repo && \
echo [ambari-${AMBARI_VER}] >> ambari.repo && \
echo name=ambari Version - ambari-${AMBARI_VER} >> ambari.repo && \
echo baseurl=http://$HTTP_HOST_ADDRESS/$TMP_REL_AMBARI_PATH >> ambari.repo && \
echo gpgcheck=0 >> ambari.repo && \
echo enabled=1 >> ambari.repo && \ 
echo priority=1 >> ambari.repo

# create custom hdp.repo
RUN echo \#VERSION_NUMBER=$HDP_VER >> hdp.repo  && \
echo [HDP-$HDP_VER] >> hdp.repo  && \
echo name=HDP Version - HDP-$HDP_VER >> hdp.repo  && \
echo baseurl=http://$HTTP_HOST_ADDRESS/$TMP_REL_HDP_PATH >> hdp.repo  && \
echo gpgcheck=0 >> hdp.repo  && \
echo enabled=1 >> hdp.repo  && \
echo priority=1 >> hdp.repo  && \
echo   >> hdp.repo  && \
echo   >> hdp.repo  && \
echo [HDP-UTILS-$HDP_UTILS_VER] >> hdp.repo  && \
echo name=HDP-UTILS Version - HDP-UTILS-$HDP_UTILS_VER >> hdp.repo  && \
echo baseurl=http:http://$HTTP_HOST_ADDRESS/$TMP_REL_HDP_UTILS_PATH >> hdp.repo  && \
echo gpgcheck=0 >> hdp.repo  && \
echo enabled=1 >> hdp.repo  && \
echo priority=1 >> hdp.repo

VOLUME $TMP_FULL_AMBARI_PATH:arch/AMBARI

COPY arch/AMBARI $TMP_FULL_AMBARI_PATH
COPY arch/HDP $TMP_FULL_HDP_PATH
COPY arch/HDP-UTILS $TMP_FULL_HDP_UTILS_PATH


