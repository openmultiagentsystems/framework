#!/usr/bin/env python

from __future__ import annotations

import os
import sys
from abc import ABC, abstractmethod
from typing import List

import pika
from database import conn, get_router_data


class Context():
    """
    The Context defines the interface of interest to clients.
    """

    def __init__(self, strategy: Strategy) -> None:
        """
            Usually, the Context accepts a strategy through the constructor, but
            also provides a setter to change it at runtime.
        """

        self._strategy = strategy

    @property
    def strategy(self) -> Strategy:
        """
            The Context maintains a reference to one of the Strategy objects. The
            Context does not know the concrete class of a strategy. It should work
            with all strategies via the Strategy interface.
        """

        return self._strategy

    @strategy.setter
    def strategy(self, strategy: Strategy) -> None:
        """
            Usually, the Context allows replacing a Strategy object at runtime.
        """

        self._strategy = strategy

    def run(self, name: str) -> None:
        """
            The Context delegates some work to the Strategy object instead of
            implementing multiple versions of the algorithm on its own.
        """

        self._strategy.run(name)


class Strategy(ABC):
    """
        The Strategy interface declares operations common to all supported versions
        of some algorithm.

        The Context uses this interface to call the algorithm defined by Concrete
        Strategies.
    """

    @abstractmethod
    def run(self, name: str):
        pass


class SendToAnother(Strategy):
    def run(self, model) -> None:
        queries = {'m1': 'insert into m2', 'm2': 'insert into m1'}
        stm = queries[model]

        print(stm)


def main():
    connection = pika.BlockingConnection(
        pika.ConnectionParameters(host='rabbitmq')
    )
    channel = connection.channel()

    channel.queue_declare(queue='router')

    def callback(ch, method, properties, body):
        # data = get_router_data()
        print(f"Received {body.decode()}")

        model = body.decode()
        context = Context(SendToAnother())
        context.run(model)

    channel.basic_consume(
        queue='router',
        on_message_callback=callback,
        auto_ack=True
    )

    print('[*] Waiting for messages. To exit press CTRL+C')

    channel.start_consuming()


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print('Interrupted')
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)
