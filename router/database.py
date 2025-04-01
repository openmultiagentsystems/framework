import os

import psycopg2
from dotenv import load_dotenv
from psycopg2.extras import execute_values

load_dotenv()

def pg_connect():
    conn = psycopg2.connect(
        database=os.getenv('DB_DATABASE'),
        user=os.getenv('DB_USERNAME'),
        host=os.getenv('DB_HOST'),
        password=os.getenv('DB_PASSWORD'),
        port=os.getenv('DB_PORT'),
        options="-c tcp_keepalives_idle=60 -c tcp_keepalives_interval=10 -c tcp_keepalives_count=5"

    )

    cursor = conn.cursor()

    conn.autocommit = True

    return conn, cursor


conn, cursor = pg_connect()


def get_router_data():
    sql = "SELECT id, agent_id, data, path, processed FROM router WHERE processed = false ORDER BY created_at ASC"

    cursor.execute(sql)

    try:
        return cursor.fetchall()
    except:
        return []
    finally:
        print('finally')
        # conn.close()
