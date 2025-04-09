from strategies import send_to_m1, send_to_m2


def get_strategy(model_name: str):
    """
        Gets which strategy is going to run

        Args:
            model_name: the model that reached the router

        Returns:
            returns
    """

    strategies = {
        'm1': send_to_m2,
        'm2': send_to_m1
    }

    return strategies[model_name]
