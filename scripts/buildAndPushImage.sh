#!/bin/sh

scripts_folder=$(dirname $(readlink -f $0))
base_folder=$(dirname $scripts_folder)
docker_folder=$base_folder/docker

. $scripts_folder/VARS.sh

echo "going to build image $IMAGE and push it to docker hub and bluemix repository..."

_pwd=`pwd`
cd $docker_folder

docker rmi $IMAGE:$IMAGE_VERSION
docker build -t $IMAGE:$IMAGE_VERSION $docker_folder
docker tag $IMAGE $DOCKER_HUB_IMG
docker tag $IMAGE $BLUEMIX_IMG
docker push $DOCKER_HUB_IMG
docker push $BLUEMIX_IMG

cd $_pwd

echo "... done."