import os

from dotenv import load_dotenv

import psycopg2
from psycopg2.extras import execute_values

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
        table.processed.eq(False)).returning('*')

    cursor.execute(q.get_sql())

    updatedRows = cursor.fetchall()

    conn.commit()

    return updatedRows
