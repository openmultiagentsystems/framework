from fastapi import APIRouter
from pydantic import BaseModel

from app.config import get_strategy
from app.context_strategy import Context
from app.database import (get_agents_by_model_name, insert_to_alive,
                          insert_to_router, update_processed)
from app.strategies.send_to_another import SendToAnother

router = APIRouter()


class Router(BaseModel):
    agent_id: str
    data: str
    path: str
    model_name: str


class Alive(BaseModel):
    agent_id: str
    model: str


@router.get('/agents')
def index():
    """
        Returns all agents by model name
    """

    return get_agents_by_model_name('')


@router.get('/check_new_agents')
def check_new_agents(model: str | None = None):
    """
        Update all records that have processed = false
        and return the ones that were actually updated.
    """

    updatedRows = update_processed()

    return updatedRows


@router.post('/model_to_router')
def model_to_router(data: Router):
    """
    """

    context = Context(get_strategy(data))
    context.run()
    # insert_to_router(data)

    # connection = pika.BlockingConnection(
    #     pika.ConnectionParameters(host='rabbitmq')
    # )
    #
    # channel = connection.channel()
    # channel.queue_declare(queue='router')
    # channel.basic_publish(
    #     exchange='',
    #     routing_key='router',
    #     body=data.model
    # )
    #
    # connection.close()

    return True


@router.post('/model_to_alive')
def model_to_alive(data: Alive):
    """
    """

    insert_to_alive(data)

    return True
