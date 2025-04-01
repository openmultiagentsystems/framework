import os

import psycopg2
from dotenv import load_dotenv
from psycopg2.extras import RealDictCursor, execute_values
from pypika import PostgreSQLQuery as Query
from pypika import Table

load_dotenv()

conn = psycopg2.connect(
    database=os.getenv('DB_DATABASE'),
    user=os.getenv('DB_USERNAME'),
    host=os.getenv('DB_HOST'),
    password=os.getenv('DB_PASSWORD'),
    port=os.getenv('DB_PORT')
)

conn.autocommit = True

cursor = conn.cursor()

c = conn.cursor(cursor_factory=RealDictCursor)


def get_agents_by_model_name(name: str):

    table = Table('agents')
    q = Query.from_(table).select('*')

    c.execute(q.get_sql())
    agents = c.fetchall()

    return agents


def update_processed():
    """
        Updates every row that has the column
        processed from False to True and
        return the ones who had processed = False
    """

    table = Table('agents')
    q = Query.update(table).set(table.processed, True).where(
        table.processed.eq(False)).returning('id', 'data', 'path')

    updatedRows = []
    try:
        cursor.execute(q.get_sql())
        updatedRows = cursor.fetchall()
    except psycopg2.OperationalError as e:
        print(str(e))
    finally:
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
    q = Query.into(table).columns('agent_id', 'model')

    for agent_id in model_data.agent_id.split(','):
        q = q.insert(agent_id, model_data.model)

    cursor.execute(q.get_sql())
    conn.commit()

    return True
