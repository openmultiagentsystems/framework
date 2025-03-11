#!/usr/bin/python

import pika
import json

import time
import os
import requests

from enum import Enum


class Model_Type(Enum):
    NETLOGO = 1
    JACAMO = 2


connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='omas_rabbitmq')
)

channel = connection.channel()
channel.queue_declare(queue='register')

API_URL = 'http://omas_interface:8000/check_new_agents'

if __name__ == '__main__':
    print("")


def host_port():
    """ Internal function, to inform host and port to access the API """
    host = os.environ['host']
    port = "5000"
    return host, port


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


def receiving_agents(modelo):
    """
        Function used by NetLogo to receive agents from the platform.
        It receives an agent from the API and inserts it into the simulation.
        Calls the check_new_agents endpoint on API
    """

    response = requests.get(API_URL, params={"model": modelo}, timeout=120)

    return_list = response.json()

    return return_list
