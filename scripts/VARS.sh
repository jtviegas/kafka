NAME=kafka
IMAGE=kaki-$NAME
IMAGE_VERSION=latest
CONTAINER=$NAME
HOST=$CONTAINER

KFK_PORT=9092

ZK_HOST=zookeeper
ZK_CONTAINER=zookeeper

BLUEMIX_CONTAINER_MEMORY=128
REGISTRY=registry.ng.bluemix.net/mynodeappbue
BLUEMIX_IMG=$REGISTRY/$IMAGE
DOCKER_HUB_IMG=kakicode/$NAME
