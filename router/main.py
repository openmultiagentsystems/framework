#!/usr/bin/env python

from __future__ import annotations

import os
import sys

import pika
from config import get_strategy
from context_strategy import Context
from database import get_router_data


def main():
    connection = pika.BlockingConnection(
        pika.ConnectionParameters(host='rabbitmq')
    )
    channel = connection.channel()
    channel.queue_declare(queue='router')

    def callback(ch, method, properties, body):
        data = get_router_data()
        print(f"Received {body.decode()}")

        model_name = body.decode()
        strategy = get_strategy(model_name)

        context = Context(strategy(data))
        context.run(model_name)

    channel.basic_consume(
        queue='router',
        on_message_callback=callback,
        auto_ack=True
    )

    print('[*] Waiting for messages. To exit press CTRL+C')

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
