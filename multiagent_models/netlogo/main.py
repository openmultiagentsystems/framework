from datetime import datetime
import os


def execute_model():
    """
        Function that executes the NetLogo model
    """


    now = datetime.now()

    model_file = os.environ['model_file']
    experiment = os.environ['experiment']

    current_time = now.strftime("%H:%M:%S")
    print("Starting model on: ", current_time)

    cmd = "/opt/netlogo/netlogo-headless.sh --model " + \
        model_file + " --experiment " + experiment
    print(cmd)

    print("Starting model...")
    os.system(cmd)

    now = datetime.now()

    current_time = now.strftime("%H:%M:%S")
    print("Model finished on: ", current_time)


if __name__ == '__main__':
    print('Starting main.py')

    if os.environ['auto_run'] == "True":
        execute_model()
