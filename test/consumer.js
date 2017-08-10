var TOPIC = process.env.TOPIC || 'producer_ticker';
var IP = process.env.ZOOKEEPER_IP || 'localhost';
var PORT = process.env.ZOOKEEPER_PORT || '2181';

var connectionString = IP + ':' + PORT + '/';

console.log('zookeeper ip is:' + IP);
console.log('zookeeper port is:' + PORT);
console.log('connectionString: ' + connectionString);

var kafka = require('kafka-node'),
    HighLevelConsumer = kafka.HighLevelConsumer,
    client = new kafka.Client(connectionString),
    consumer = new HighLevelConsumer(
        client,
        [
            { topic: TOPIC }
        ],
        {
            encoding: 'utf8'
        }
    );

consumer.on('message', function (message) {
    console.log('consuming messages...');
    console.log(message);
});

consumer.on('error', 
    function (err) {
        console.log(err);
    }
);