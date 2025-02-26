#!/usr/bin/env python

import pika
import sys
import os
import json
import random

from database import insert_agent


def main():
    connection = pika.BlockingConnection(
        pika.ConnectionParameters(host='omas_rabbitmq')
    )
    channel = connection.channel()

    channel.queue_declare(queue='register')

    def callback(ch, method, properties, body):
        print(f"Received {body.decode()}")

        data = json.loads(body.decode())

        arr = []
        for number in range(data['min'], data['max']):
            arr.append(random.randint(5, 25))
            arr.append(random.randint(1, 4))
            arr.append(random.randint(1, 6))

        data = [data['type_id'], str(arr), '']

        insert_agent(data)

    channel.basic_consume(
        queue='register',
        on_message_callback=callback,
        auto_ack=True
    )

    print(' [*] Waiting for messages. To exit press CTRL+C')

    channel.start_consuming()


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print('Interrupted')
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)
