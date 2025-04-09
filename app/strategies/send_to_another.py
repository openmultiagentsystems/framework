# from database import update_unprocessed

from app.context_strategy import Strategy


class SendToM1(Strategy):
    def __init__(self, data):
        self.data = data

    def run(self, name: str) -> None:

        # update_unprocessed(self.data)

        end_of_line = {
            'm1': 'm2',
            'm2': 'm1'
        }

        # stm = end_of_line[name]
