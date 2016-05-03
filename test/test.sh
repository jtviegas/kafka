#!/bin/sh

dowehaveit=`npm ls | grep kafka-node | wc -l`

if [ "0" -eq "$dowehaveit" ]
then
	npm install kafka-node	
fi 

node consumer.js &
node producer.js &

echo "...don't forget to kill node processes on the way out: killall node"