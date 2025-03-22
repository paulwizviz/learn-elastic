#!/bin/bash

if [ "$(basename $(realpath .))" != "learn-elastic" ]; then
    echo "You are outside the scope of the project"
    exit 0
fi

export ELASTIC_IMAGE=elasticsearch:7.17.9
export NETWORK_NAME=learn-elastic_network

COMMAND=$1

case $COMMAND in
    "clean")
        docker-compose -f ./deployment/docker-cluster/docker-compose.yml down
        docker rmi -f ${ELASTIC_IMAGE}
        docker rmi -f $(docker images --filter "dangling=true" -q)
        rm -rf ./deployment/docker-cluster/volumes
        ;;
    "start")
        docker-compose -f ./deployment/docker-cluster/docker-compose.yml up
        ;;
    "stop")
        docker-compose -f ./deployment/docker-cluster/docker-compose.yml down
        ;;
     *)
        echo "$0 [clean | start | stop]"
        ;;
esac