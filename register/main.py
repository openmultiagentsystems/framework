#!/usr/bin/env python

import json
import os
import random
import sys

import pika
import requests
from database import insert_agent


def main():
    connection = pika.BlockingConnection(
        pika.ConnectionParameters(host='rabbitmq')
    )
    channel = connection.channel()

    channel.queue_declare(queue='register')

    def callback(ch, method, properties, body):
        print(f"Received {body.decode()}")

        model_data = json.loads(body.decode())

        if (model_data['llm_register']):
            res = requests.post(
                'http://ollama:11434/api/generate',
                json={
                    "model": "llama2",
                    "prompt": "Generate exactly a JSON array with 30 elements. Each element should be of the form: [1, '[odd1 odd2 odd3]', '', 1], where odd1, odd2, and odd3 are random strictly odd integers between 1 and 999. Output only the JSON array, with no explanations or extra text. Format must be valid JSON.",
                    "stream": False
                }
            )

            j = res.json()
            data = [
                model_data['type_id'],
                j['response'].replace('\n', ''),
                '',
                model_data['model_id']
            ]

            print(data)
        else:
            data = []
            for number in range(model_data['min'], model_data['max']):
                arr = []

                arr.append('[')
                arr.append(str(random.randint(5, 25)))
                arr.append(' ')

                arr.append(str(random.randint(1, 4)))
                arr.append(' ')

                arr.append(str(random.randint(1, 6)))
                arr.append(']')

                arr_string = "".join(arr)

                data.append([
                    model_data['type_id'],
                    str(arr_string),
                    '',
                    model_data['model_id']
                ])

        # insert_agent(data)

    channel.basic_consume(
        queue='register',
        on_message_callback=callback,
        auto_ack=True
    )

    print(' [*] Waiting for messages. To exit press CTRL+C')

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
