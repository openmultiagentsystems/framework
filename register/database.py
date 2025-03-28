import os

import psycopg2
from dotenv import load_dotenv
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
    sql = "INSERT INTO agents (type_id, data, path, model_id) VALUES %s"

    execute_values(
        conn.cursor(),
        sql,
        data,
        template="(%s, %s, %s, %s)",
        page_size=1000,
        fetch=False
    )

    conn.commit()
