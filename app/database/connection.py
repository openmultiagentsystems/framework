import os

from dotenv import load_dotenv

import psycopg2

load_dotenv()

conn = psycopg2.connect(
    database=os.getenv('DB_DATABASE'),
    user=os.getenv('DB_USERNAME'),
    host=os.getenv('DB_HOST'),
    password=os.getenv('DB_PASSWORD'),
    port=os.getenv('DB_PORT')
)


#
# url = URL.create(
#     "postgresql",
#     os.getenv('DB_USERNANE'),
#     os.getenv('DB_PASSWORD'),
#     os.getenv('DB_HOST'),
#     os.getenv('DB_PORT'),
#     os.getenv('DB_DATABASE'),
# )
#
# engine = create_engine(url)
# con = engine.connect()

# cur = conn.cursor()
#
# cur.execute("SELECT * FROM m1")
# cur.fetchall()
