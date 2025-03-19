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

cursor = conn.cursor()


def get_router_data():
    sql = "SELECT id, agent_id, data, path, processed FROM router WHERE processed = false ORDER BY created_at ASC"

    cursor.execute(sql)

    try:
        return cursor.fetchall()
    except:
        return []

