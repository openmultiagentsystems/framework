import pika
import json

connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='rabbitmq')
)

channel = connection.channel()
channel.queue_declare(queue='register')

data = json.dumps({
    "type_id": 1,
    "model": 'from_script',
    "min": 1,
    "max": 5
})

channel.basic_publish(
    exchange='',
    routing_key='register',
    body=data
)

connection.close()
