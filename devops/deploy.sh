#!/bin/sh

devops_folder=$(dirname $(readlink -f $0))
base_folder=$(dirname $devops_folder)

. $devops_folder/VARS.sh

IMAGE_ID=`docker images | grep -E "^$IMAGE*" | awk -e '{print $3}'`

docker tag $IMAGE_ID $BLUEMIX_IMG
docker push $BLUEMIX_IMG

cf ic run --name $HOST --name $CONTAINER --link $ZK_CONTAINER:$ZK_HOST -p $KFK_PORT -m $BLUEMIX_CONTAINER_MEMORY $BLUEMIX_IMG

sleep 12
cf ic logs $CONTAINER
