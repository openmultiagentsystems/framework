import os

from dotenv import load_dotenv

import psycopg2
# from psycopg2.extras import execute_values
from fastapi.encoders import jsonable_encoder

from pypika import Table, PostgreSQLQuery as Query


load_dotenv()

conn = psycopg2.connect(
    database=os.getenv('DB_DATABASE'),
    user=os.getenv('DB_USERNAME'),
    host=os.getenv('DB_HOST'),
    password=os.getenv('DB_PASSWORD'),
    port=os.getenv('DB_PORT')
)

cursor = conn.cursor()


def update_processed():
    """
        Updates every row that has the column
        processed from False to True and
        return the ones who had processed = False
    """

    table = Table('agents')
    q = Query.update(table).set(table.processed, True).where(
        table.processed.eq(False)).returning('id', 'data', 'path')

    cursor.execute(q.get_sql())

    updatedRows = cursor.fetchall()

    conn.commit()

    return updatedRows


def insert_to_router(model_data):

    table = Table('router')
    q = Query.into(table).columns('agent_id', 'data', 'path').insert(model_data.agent_id,
                                                                     model_data.data, model_data.path)
    cursor.execute(q.get_sql())

    conn.commit()

    return True


def insert_to_alive(model_data):

    table = Table('alive_agents')
    q = Query.into(table).columns('agent_id', 'model').insert('1', 'm1')

    for agent_id in model_data.agent_id.split(','):
        q = q.insert((agent_id, model_data.model))

    cursor.execute(q.get_sql())
    conn.commit()

    return True
