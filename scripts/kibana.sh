#!/bin/bash

if [ "$(basename $(realpath .))" != "learn-elastic" ]; then
    echo "You are outside the scope of the project"
    exit 0
fi

version=7.17.9
export ELASTIC_IMAGE=elasticsearch:$version
export KIBANA_IMAGE=kibana:$version
export NETWORK=learn-elastic_network

COMMAND=$1

case $COMMAND in
    "clean")
        docker-compose -f ./deployment/kibana/docker-compose.yml down
        docker rmi -f ${ELASTIC_IMAGE}
        docker rmi -f ${KIBANA_IMAGE}
        docker rmi -f $(docker images --filter "dangling=true" -q)
        rm -rf ./deployment/kibana/volumes
        ;;
    "start")
        docker-compose -f ./deployment/kibana/docker-compose.yml up
        ;;
    "stop")
        docker-compose -f ./deployment/kibana/docker-compose.yml down
        ;;
    *)
        echo "$0 [clean | start | stop]"
        ;;
esac
