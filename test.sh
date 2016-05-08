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

cd $_pwd
#node producer.js &
node test/consumer.js
#node test/producer.js &

#echo "...don't forget to kill node processes on the way out: killall node"
