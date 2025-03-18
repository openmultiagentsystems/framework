from fastapi import APIRouter
from app.database import update_processed, insert_to_router, insert_to_alive
from pydantic import BaseModel

import pika

router = APIRouter()


class Router(BaseModel):
    agent_id: str
    data: str
    path: str


class Alive(BaseModel):
    agent_id: str
    model: str


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

    insert_to_router(data)

    return True


@router.post('/model_to_alive')
def model_to_alive(data: Alive):
    """
    """

    insert_to_alive(data)

    connection = pika.BlockingConnection(
        pika.ConnectionParameters(host='rabbitmq')
    )

    channel = connection.channel()
    channel.queue_declare(queue='router')
    channel.basic_publish(
        exchange='',
        routing_key='router',
        body="hello"
    )

    connection.close()


    return True
