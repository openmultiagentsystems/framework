#!/usr/bin/python

import pika
import json

from enum import Enum


class Model_Type(Enum):
    NETLOGO = 1
    JACAMO = 2


connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='omas_rabbitmq')
)

channel = connection.channel()
channel.queue_declare(queue='register')

if __name__ == '__main__':
    print("")


def request_to_register(model, min, max):
    """
        Sends a message to the register to create
        agents based on the what comes from NetLogo.

        Currently this runs when a container containing a netlogo
        model goes up.

        Args:
            model: the name of the model that is sending the message
            min: the minimum amount of agents
            max: the maximum amount of agents
    """

    data = json.dumps({
        "type_id": Model_Type.NETLOGO.value,
        "model": model,
        "min": min,
        "max": max
    })

    channel.basic_publish(
        exchange='',
        routing_key='register',
        body=data
    )

    connection.close()

    return True
