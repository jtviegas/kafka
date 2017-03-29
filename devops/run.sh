#!/bin/sh

devops_folder=$(dirname $(readlink -f $0))
base_folder=$(dirname $devops_folder)

. $devops_folder/VARS.sh
docker stop $CONTAINER
docker rm $CONTAINER

docker run -d -h $HOST --name $CONTAINER  --network=$NETWORK --link $ZK_CONTAINER:$ZK_HOST -P $IMAGE:$IMAGE_VERSION
#docker run -d -h $HOST --name $CONTAINER -p $KFK_PORT:$KFK_PORT --link $ZK_CONTAINER:$ZK_HOST $IMAGE:$IMAGE_VERSION
docker logs -f $CONTAINER