#!/usr/bin/python

import json
import logging
from enum import Enum

import pika
import requests
from requests import ConnectionError, HTTPError

logger = logging.getLogger('netlogo')

logger.setLevel(logging.INFO)
formatter = logging.Formatter('%(asctime)s | %(levelname)s | %(message)s')

file_handler = logging.FileHandler('../netlogo.log')
file_handler.setLevel(logging.DEBUG)
file_handler.setFormatter(formatter)

logger.addHandler(file_handler)


class Model_Type(Enum):
    NETLOGO = 1
    JACAMO = 2


MODELS = {
    'm1': 1,
    'm2': 2,
}

connection = pika.BlockingConnection(
    pika.ConnectionParameters(host="rabbitmq")
)

channel = connection.channel()
channel.queue_declare(queue="register")

API_URL = "http://api:8000/"
CHECK_NEW_AGENT_URL = API_URL + "check_new_agents"
MODEL_TO_ROUTER_URL = API_URL + "model_to_router"
MODEL_TO_ALIVE_URL = API_URL + "model_to_alive"

if __name__ == "__main__":
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

    logger.info('')
    logger.info('request to register')
    logger.info('dispatching to register queue')
    logger.info('with the following data:')
    logger.info('type_id: ' + str(Model_Type.NETLOGO.value))
    logger.info('model: ' + str(model))
    logger.info('min: ' + str(min))
    logger.info('max: ' + str(max))
    logger.info('')

    data = json.dumps({
        "type_id": Model_Type.NETLOGO.value,
        "model_id": MODELS[model],
        "min": min,
        "max": max
    })

    channel.basic_publish(exchange="", routing_key="register", body=data)

    connection.close()

    return True


def receiving_agents(model):
    """
    Function used by NetLogo to receive agents from the platform.
    It receives an agent from the API and inserts it into the simulation.
    Calls the check_new_agents endpoint on API

    Args:
        model: the name of the model that is sending the message

    Returns:
        List of agents that were just processed
    """

    logger.info('')
    logger.info('check new agents')
    logger.info('sending a request to: ' + CHECK_NEW_AGENT_URL)
    logger.info('for model ' + str(model))
    logger.info('')

    try:
        res = requests.get(
            CHECK_NEW_AGENT_URL,
            params={"model": MODELS[model]},
            timeout=120
        )

        return res.json()
    except ConnectionError:
        logger.exception('connection error')
        return False
    except HTTPError:
        logger.exception('http error')
        return False


def send_agent_to_router(agent_id, data, path, model_name):
    """
        Function used by NetLogo, to send agents to the platform.
        It removes an agent from the simulation and sends it
        to the API (to be inserted in the router table).
        Calls the model_to_router endpoint on API

        Args:
            agent_id: the id of the agent
            data: the actual data of the agent itself, depends on the model...
            path
    """

    logger.info('')
    logger.info('send agent to router')
    logger.info('sending a request to: ' + MODEL_TO_ROUTER_URL)
    logger.info('with the following data:')
    logger.info('agent_id: ' + agent_id)
    logger.info('data: ' + data)
    logger.info('path: ' + path)
    logger.info('')

    json = {
        "agent_id": agent_id,
        "data": data,
        "path": path,
        "model_name": model_name
    }

    try:
        requests.post(
            MODEL_TO_ROUTER_URL,
            json=json,
            timeout=120
        )
    except ConnectionError:
        logger.exception('connection error')
        return False
    except HTTPError:
        logger.exception('http error')
        return False


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
    logger.info('')
    logger.info('send agent to alive')
    logger.info('sending a request to: ' + MODEL_TO_ROUTER_URL)
    logger.info('with the following data:')
    logger.info('agent_id: ' + str(agent_id))
    logger.info('model: ' + str(model))
    logger.info('')

    json = {"agent_id": agent_id, "model": MODELS[model]}

    try:
        res = requests.post(
            MODEL_TO_ALIVE_URL,
            json=json,
            timeout=120
        )

        return res.json()
    except ConnectionError:
        logger.exception('connection error')
        return False
    except HTTPError:
        logger.exception('http error')
        return False
