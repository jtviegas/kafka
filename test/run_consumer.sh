#!/bin/sh

test_folder=$(dirname $(readlink -f $0))
base_folder=$(dirname $test_folder)

. $test_folder/VARS.sh

export TOPIC
export ZOOKEEPER_IP
export ZOOKEEPER_PORT

dowehaveit=`npm ls | grep kafka-node | wc -l`
if [ "0" -eq "$dowehaveit" ]
then
	npm install kafka-node	
fi 

node consumer.js 

echo "...don't forget to kill node processes on the way out: killall node"
