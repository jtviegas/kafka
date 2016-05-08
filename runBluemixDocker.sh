#!/bin/sh

. ./VARS.sh

cf ic run --name $HOST --name $CONTAINER -p $ZOOKEEPER_PORT -p $KAFKA_PORT --env ADVERTISED_HOST="$IP" --env AUTO_CREATE_TOPICS=true -m $BLUEMIX_CONTAINER_MEMORY $BLUEMIX_IMG

sleep 6
cf ic ip bind $IP $CONTAINER
sleep 6
cf ic logs $CONTAINER