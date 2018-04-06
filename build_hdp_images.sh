#!/bin/bash

HDP_REPO_BUILD=0
HDP_REPO_BUILD_WITH=existed

HDP_SINGLE_NODE_COMPOSE_FILE=containers/repo-cache/repo-cache.yml
HDP_REPO_NODE_COMPOSE_FILE=containers/repo-cache/repo-cache.yml


usage() {
  exitcode="$1"
  cat << USAGE >&2
Usage:
  $cmdname [--build-hdp-repo]
  --build-hdp-repo=\{cache, no-cache, existed\}                    Before building images for HDP cluster script builds REPO-CACHE image.
  --help                              Print this help 
USAGE
  exit "$exitcode"
}

while [ $# -gt 0 ]
do
  case "$1" in
    --build-hdp-repo)
     HDP_REPO_BUILD=1
    shift
    break 
    ;;
    --help)
    usage 0
    break
    ;;
    *)
    echo "Unknown argument: $1"
    usage 1
    break
    ;;
  esac
done

source ./env/set_env.sh


if [ $HDP_REPO_BUILD -eq 1 ]; then

   echo Building repo-cache image with local repository for Ambari version $AMBARI_VER and HDP version $HDP_VER
   
   case "$HDP_REPO_BUILD_WITH" in
   	no-cache)
   	    echo Build new REPO-CACHE image without using cache	 	
	    docker-compose -f $HDP_REPO_NODE_COMPOSE_FILE build --no-cache
   		;;
   	cache)
   	    echo Build new REPO-CACHE image using cache	 	
	    docker-compose -f $HDP_REPO_NODE_COMPOSE_FILE build
   		;;
   	existed)
   		echo Use existing REPO-CACHE image	 	
   		;;
   	*)
		echo Unknown REPO-CACHE image build parameter value
		exit 1
   		;;	
   esac
fi	
 
echo Starting REPO-CACHE container

docker-compose -f $HDP_REPO_NODE_COMPOSE_FILE up --detach

# echo Build 
# docker-compose -f $HDP_SINGLE_NODE_COMPOSE_FILE build --no-cache

# echo  Shutting down REPO-CACHE container
# docker-compose -f $HDP_REPO_NODE_COMPOSE_FILE down
