#!/bin/sh

. ./VARS.sh

export ZOOKEEPER_IP
export ZOOKEEPER_PORT

dowehaveit=`npm ls | grep kafka-node | wc -l`
if [ "0" -eq "$dowehaveit" ]
then
	npm install kafka-node	
fi 
export DEBUG=kafka-node:*
node producer.js

echo "...don't forget to kill node processes on the way out: killall node"
