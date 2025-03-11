from fastapi import APIRouter
from app.database import update_processed

router = APIRouter()


@router.get('/check_new_agents')
def check_new_agents(model: str | None = None):
    """
        Update all records that have processed = false
        and return the ones that were actually updated.
    """

    updatedRows = update_processed()

    return updatedRows
