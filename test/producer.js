var IP = process.env.ZOOKEEPER_IP || 'localhost';
var PORT = process.env.ZOOKEEPER_PORT || '2181';

var connectionString = IP + ':' + PORT + '/';

console.log('zookeeper ip is:' + IP);
console.log('zookeeper port is:' + PORT);
console.log('connectionString: ' + connectionString);

var kafka = require('kafka-node'),
    Producer = kafka.Producer,
    KeyedMessage = kafka.KeyedMessage,
    client = new kafka.Client(connectionString),
    producer = new Producer(client),
    km = new KeyedMessage('key', 'message'),
    payloads = [  { topic: 'topic1', messages: 'hi', partition: 0 },
        { topic: 'topic2', messages: ['hello', 'world', km] }
    ];

producer.on('ready', function () {
	console.log('producing messages...');
    producer.send(payloads, function (err, data) {
        console.log(data);
    });
});

producer.on('error', 
	function (err) {
		console.log(err);
	}
);


