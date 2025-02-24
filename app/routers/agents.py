from fastapi import APIRouter
from app.database import cursor

router = APIRouter()


@router.get('/agents/register')
def register():
    """
        Register an agent on the platform.
    """

    cursor.execute("SELECT * FROM m1")
    result = cursor.fetchall()

    return {"results": result}
