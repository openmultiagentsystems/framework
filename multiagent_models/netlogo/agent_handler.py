#!/usr/bin/python

import pika
import json

import requests
from requests import ConnectionError, HTTPError

from enum import Enum


class Model_Type(Enum):
    NETLOGO = 1
    JACAMO = 2


connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='rabbitmq')
)

channel = connection.channel()
channel.queue_declare(queue='register')

API_URL = 'http://api:8000/'

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


def receiving_agents(model):
    """
        Function used by NetLogo to receive agents from the platform.
        It receives an agent from the API and inserts it into the simulation.
        Calls the check_new_agents endpoint on API

        Args:
            modelo: the name of the model that is sending the message

        Returns:
            List of agents that were just processed
    """

    url = API_URL + 'check_new_agents'

    try:
        res = requests.get(url, params={"model": model}, timeout=120)
        return res.json()
    except ConnectionError as ce:
        return False
    except HTTPError as he:
        return False


def send_agent_to_router(agent_id, data, path):
    url = API_URL + 'model_to_router'
    json = {"agent_id": agent_id, "data": data, "path": path}

    try:
        requests.post(url, json=json, timeout=120)
    except ConnectionError as ce:
        return False
    except HTTPError as he:
        return False
    finally:
        return True


def send_agent_to_alive(agent_id, model):
    """
        Function used by NetLogo, when the simulation is over.
        It removes an agent from the simulation and sends it
        to the API (to be inserted in alive_agents table).
        Calls the model_to_alive endpoint on API

        Args:
            agent_id: the id of the agent corresponds to id in the agents table
            model: the name of the model that is sending the message
    """

    url = API_URL + 'model_to_alive'
    json = {"agent_id": agent_id, "model": model}

    try:
        return requests.post(url, json=json, timeout=120)
    except ConnectionError as ce:
        return False
    except HTTPError as he:
        return False
    finally:
        return True
