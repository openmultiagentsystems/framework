from app.context_strategy import Strategy


class send_to_m1(Strategy):
    def __init__(self, data):
        self.data = data

    def run(self) -> None:
        
