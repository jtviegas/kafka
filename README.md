# kafka
kafka service

- exposes ports: 9092
- expects to resolve zookeeper on "zookeeper" hostname

usage:
	devops/build_images.sh - build docker image
	devops/run.sh - run in local docker engine
	devops/deploy.sh - run in bluemix