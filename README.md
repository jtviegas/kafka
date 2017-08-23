# kafka
## kafka docker image

- hostname: kafka
- exposes ports: 9092
- expects to resolve zookeeper on "zookeeper" hostname
- automatic creation of topics from received messages

### usage:

- edit VARS.sh accordingly:
  ```
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
  ```
- scripts/buildAndPushImage.sh - build docker image and push it to dockerHub (/kakicode/kafka) and private bluemix registry (registry.ng.bluemix.net/mynodeappbue/kafka)
- scripts/runLocal.sh - run on local docker engine
- scripts/runOnBluemix.sh - run on bluemix
- scripts/attachOnBluemix.sh - attach to bluemix bash process
