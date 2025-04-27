from fastapi import APIRouter
from pydantic import BaseModel

from app.config import get_strategy
from app.context_strategy import Context
from app.database import (get_agents_by_model_name, insert_to_alive,
                          insert_to_router, set_out_of_model, update_processed)

router = APIRouter()


class Router(BaseModel):
    agent_id: str
    data: str
    path: str
    model_name: str


class Alive(BaseModel):
    agent_id: str
    model_id: int


@router.get('/agents')
def index():
    """
        Returns all agents by model name
    """

    return get_agents_by_model_name('')


@router.get('/agents/check')
def check_new_agents(modelId: str | None = None):
    """
        Update all records that have processed = false
        and return the ones that were actually updated.
    """

    updatedRows = update_processed(modelId)

    return updatedRows


@router.post('/routing/agents')
def model_to_router(data: Router):
    """
    """

    strategy = get_strategy(data)

    context = Context(strategy(data))
    context.run()

    return True


@router.post('/agents/alive')
def model_to_alive(data: Alive):
    """
    """

    insert_to_alive(data)

    return True
