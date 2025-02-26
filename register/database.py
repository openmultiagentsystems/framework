import os

from dotenv import load_dotenv

import psycopg2
from psycopg2.extras import execute_values

load_dotenv()

conn = psycopg2.connect(
    database=os.getenv('DB_DATABASE'),
    user=os.getenv('DB_USERNAME'),
    host=os.getenv('DB_HOST'),
    password=os.getenv('DB_PASSWORD'),
    port=os.getenv('DB_PORT')
)


def insert_agent(data):
    sql = "INSERT INTO agents (type_id, data, path) VALUES %s"

    execute_values(
        conn.cursor(),
        sql,
        data,
        template="(%s, %s::vector, %s)",
        page_size=1000,
        fetch=False
    )

    conn.commit()
