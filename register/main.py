#!/usr/bin/env python

import json
import os
import random
import sys

import pika
import requests
from database import insert_agent
from openai import OpenAI


def ask_chatgpt(prompt_text):
    try:
        client = OpenAI(api_key=os.getenv('OPENAPI_KEY'))

        messages = [
            {"role": "user", "content": prompt_text}
        ]

        response = client.chat.completions.create(
            model='gpt-4o-mini',
            messages=messages,
            temperature=0.0,
            response_format={"type": "json_object"} if True else None
        )

        return response.choices[0].message.content

    except Exception as e:
        return f"An error occurred: {e}"


prompt = """
    I need an array with 100 arrays that contain 3 numbers each.
    Do not return a text with the code to generate the array.

    Generate the array for me and return it as JSON like the following

    {
        "data": [[n1, n2, n3], ...]
    }
"""


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
            data = ask_chatgpt(prompt)
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
