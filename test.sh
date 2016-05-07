#!/bin/sh

. ./VARS.sh

export ZOOKEEPER_IP=$IP

_pwd=`pwd`
cd test

dowehaveit=`npm ls | grep kafka-node | wc -l`
if [ "0" -eq "$dowehaveit" ]
then
	npm install kafka-node	
fi 

node producer.js &
node consumer.js &
#node test/producer.js &

cd $_pwd

echo "...don't forget to kill node processes on the way out: killall node"