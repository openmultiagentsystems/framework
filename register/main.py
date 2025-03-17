#!/usr/bin/env python

import pika
import sys
import os
import json
import random

from database import insert_agent


def main():
    connection = pika.BlockingConnection(
        pika.ConnectionParameters(host='rabbitmq')
    )
    channel = connection.channel()

    channel.queue_declare(queue='register')

    def callback(ch, method, properties, body):
        print(f"Received {body.decode()}")

        model_data = json.loads(body.decode())

        data = []
        for number in range(model_data['min'], model_data['max']):
            arr = []

            arr.append('[')
            arr.append(str(random.randint(5, 25)))
            arr.append(' ')

            arr.append(str(random.randint(1, 4)))
            arr.append(' ')

            arr.append(str(random.randint(1, 6)))
            arr.append(']')

            arr_string = "".join(arr)

            data.append([model_data['type_id'], str(arr_string), ''])

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
