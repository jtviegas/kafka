
var kafka = require('kafka-node'),
    HighLevelConsumer = kafka.HighLevelConsumer,
    client = new kafka.Client(),
    consumer = new HighLevelConsumer(
        client,
        [
            { topic: 'topic1' }, { topic: 'topic2' }
        ],
        {
            encoding: 'utf8'
        }
    );

consumer.on('message', function (message) {
    console.log('consuming messages...');
    console.log(message);
});