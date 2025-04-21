#!/bin/bash

if [ "$(basename $(realpath .))" != "learn-elastic" ]; then
    echo "You are outside the scope of the project"
    exit 0
fi

version=8.17.3
export ELASTIC_IMAGE=elasticsearch:$version
export KIBANA_IMAGE=kibana:$version
export LOGSTASH_IMAGE=logstash:$version
export NETWORK_NAME=learn-elastic_network

COMMAND=$1

case $COMMAND in
    "clean")
        docker-compose -f ./deployment/docker-elk/docker-compose.yml down
        docker rmi -f ${ELASTIC_IMAGE}
        docker rmi -f ${KIBANA_IMAGE}
        docker rmi -f ${LOGSTASH_IMAGE}
        docker rmi -f $(docker images --filter "dangling=true" -q)
        rm -rf ./deployment/docker-elk/volumes
        ;;
    "start")
        docker-compose -f ./deployment/docker-elk/docker-compose.yml up
        ;;
    "stop")
        docker-compose -f ./deployment/docker-elk/docker-compose.yml down
        ;;
     *)
        echo "$0 [clean | start | stop]"
        ;;
esac