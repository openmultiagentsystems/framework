from app.strategies.send_to_m1 import send_to_m1
from app.strategies.send_to_m2 import send_to_m2


def get_name(data: dict):
    """
        Get the name of the model

        Args:
            data: a dictionary with the key below

            {
                "agent_id": agent_id,
                "data": data,
                "path": path,
                "model_name": model_name
            }

        Returns:
            returns the model_name key
    """

    return data.model_name


def get_strategy(data: dict):
    """
        Gets which strategy is going to run

        Args:
            model_name: the model that reached the router

        Returns:
            returns a class that implements "run" method
    """

    strategies = {
        'm1': send_to_m2,
        'm2': send_to_m1,
    }

    return strategies[get_name(data)]
