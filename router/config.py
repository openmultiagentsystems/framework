from strategies.send_to_another import SendToAnother


def get_strategy(model_name: str):
    """
        Gets which strategy is going to run

        Args:
            model_name: the model that reached the router

        Returns:
            returns
    """

    strategies = {
        'm1': SendToAnother,
        'm2': SendToAnother,
    }

    return strategies[model_name]
