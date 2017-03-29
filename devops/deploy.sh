#!/bin/sh

devops_folder=$(dirname $(readlink -f $0))
base_folder=$(dirname $devops_folder)

. $devops_folder/VARS.sh

IMAGE_ID=`docker images | grep -E "^$IMAGE*" | awk -e '{print $3}'`

docker tag $IMAGE_ID $BLUEMIX_IMG
docker push $BLUEMIX_IMG

cf ic stop $CONTAINER
cf ic rm $CONTAINER

sleep 24
cf ic run -d --name $CONTAINER -p $KFK_PORT --link $ZK_CONTAINER:$ZK_HOST -m $BLUEMIX_CONTAINER_MEMORY $BLUEMIX_IMG
sleep 36
cf ic logs -f $CONTAINER
