from context_strategy import Strategy
from database import conn


class SendToAnother(Strategy):
    # TODO: Add __init__ to receive data

    def run(self, name: str) -> None:
        query = 'INSERT INTO agents VALUES (%s, %s, %s, %s)'

        end_of_line = {
            'm1': 'm2',
            'm2': 'm1'
        }

        stm = end_of_line[name]


