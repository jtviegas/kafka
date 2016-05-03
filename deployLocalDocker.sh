#!/bin/sh

. ./VARS.sh

docker run -h $HOST -d --name $CONTAINER -p $ZOOKEEPER_PORT:$ZOOKEEPER_PORT -p $KAFKA_PORT:$KAFKA_PORT --env AUTO_CREATE_TOPICS=true  $SRC_IMG