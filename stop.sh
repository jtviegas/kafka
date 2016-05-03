#!/bin/sh

KAFKA_CONTAINER=kafka

docker stop $KAFKA_CONTAINER
docker rm -f $KAFKA_CONTAINER	