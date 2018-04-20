#!/bin/bash

HDP_REPO_BUILD=0
HDP_REPO_BUILD_WITH=use-existing
#cache
#no-cache
#use-existing

HDP_BUILD_WITH=cache
#no-cache
#cache


source ./env/set_env.sh


if [ $HDP_REPO_BUILD -eq 1 ]; then

   echo Building repo-cache image with local repository for Ambari version $AMBARI_VER and HDP version $HDP_VER
   
   case "$HDP_REPO_BUILD_WITH" in
   	no-cache)
   	    echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
   	    echo Start building new REPO-CACHE image without using cache	 	
	    docker-compose -f $HDP_REPO_NODE_COMPOSE_FILE build --no-cache
   	    echo Building REPO-CACHE image completed	 	
   	    echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
   		;;
   	cache)
   	    echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
   	    echo Start building new REPO-CACHE image using cache	 	
	      docker-compose -f $HDP_REPO_NODE_COMPOSE_FILE build
   	    echo Building REPO-CACHE image completed	 	
   	    echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
   		;;
   	use-existing)
   		echo Use existing REPO-CACHE image	 	
   		;;
   	*)
		echo Unknown REPO-CACHE image build parameter value
		exit 1
   		;;	
   esac
fi	
 
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
echo Starting REPO-CACHE container

docker-compose -f $HDP_REPO_NODE_COMPOSE_FILE up --detach --remove-orphans

echo Started REPO-CACHE container
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#

echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
echo Start building new HDP cluster images

   case "$HDP_BUILD_WITH" in
    no-cache)
        echo With no-cache option    
        docker-compose -f $HDP_COMPOSE_FILE build --no-cache
      ;;
    cache)
        echo With cache option
       docker-compose -f $HDP_COMPOSE_FILE build 
      ;;  
   esac


echo Build new HDP cluster images
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#

echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
echo  Shutting down REPO-CACHE container

docker-compose -f $HDP_REPO_NODE_COMPOSE_FILE down

echo  Shutting down REPO-CACHE container competed
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#






