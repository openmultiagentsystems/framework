from app.context_strategy import Strategy
from app.database import conn


class send_to_m2(Strategy):
    def __init__(self, data):
        self.data = data

    def run(self) -> None:
        sql = "update agents set data = %s, path = %s, processed = false, model_id = 2 where id = %s"

        tuple = (self.data.data, self.data.path, self.data.agent_id)

        c = conn.cursor()
        c.execute(sql, tuple)

        conn.commit()
