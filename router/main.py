#!/usr/bin/env python

import pika
import sys
import os
import json
import random


def main():
    connection = pika.BlockingConnection(
        pika.ConnectionParameters(host='rabbitmq')
    )
    channel = connection.channel()

    channel.queue_declare(queue='router')

    def callback(ch, method, properties, body):
        print(f"Received {body.decode()}")


    channel.basic_consume(
        queue='router',
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
