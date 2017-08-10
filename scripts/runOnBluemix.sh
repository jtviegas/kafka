#!/bin/sh

scripts_folder=$(dirname $(readlink -f $0))
base_folder=$(dirname $scripts_folder)

. $scripts_folder/VARS.sh

#IMAGE_ID=`docker images | grep -E "^$IMAGE.*latest" | awk -e '{print $3}'`
#echo "...image id: $IMAGE_ID"
#docker tag $IMAGE_ID $BLUEMIX_IMG
#docker push $BLUEMIX_IMG

CONTAINER_ID=`cf ic ps -a | grep -E "$BLUEMIX_IMG:$IMAGE_VERSION" | awk -e '{print $1}'`
echo "...container id: $CONTAINER_ID"

if [ ! -z "$CONTAINER_ID" ]; then

	cf ic stop $CONTAINER_ID

	stopped="1"
	while [ "$stopped" -ne "0" ]
	do
	        cf ic ps -a | grep $CONTAINER_ID | grep Shutdown
	        stopped=$?
	        echo "has container stopped (0=true) ? $stopped"
	        sleep 6
	done

	cf ic rm $CONTAINER_ID

	removed="0"
	while [ "$removed" -ne "1" ]
	do
	        cf ic ps -a | grep $CONTAINER_ID
	        removed=$?
	        echo "has container been removed (1=true) ? $removed"
	        sleep 6
	done

fi


cf ic run -d --name $CONTAINER -p $KFK_PORT --link $ZK_CONTAINER:$ZK_HOST -m $BLUEMIX_CONTAINER_MEMORY $BLUEMIX_IMG

running="1"
while [ "$running" -ne "0" ]
do
        cf ic ps -a | grep $CONTAINER | grep Running
        running=$?
        echo "is container running (0=true) ? $running"
        sleep 6
done

cf ic logs -f $CONTAINER
