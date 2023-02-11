#!/bin/bash

export ELASTIC_IMAGE=docker.elastic.co/elasticsearch/elasticsearch:7.5.0
export KIBANA_IMAGE=docker.elastic.co/kibana/kibana:7.5.0
export NETWORK=learn-express_es

COMMAND=$1

case $COMMAND in
    "clean")
        docker-compose -f ./deployment/docker-compose.yml down
        docker rmi -f ${ELASTIC_IMAGE}
        docker rmi -f ${KIBANA_IMAGE}
        docker rmi -f $(docker images --filter "dangling=true" -q)
        rm -rf ./tmp
        ;;
    "start")
        docker-compose -f ./deployment/docker-compose.yml up
        ;;
    "stop")
        docker-compose -f ./deployment/docker-compose.yml down
        ;;
    *)
        echo "$0 [start | stop]"
        ;;
esac
