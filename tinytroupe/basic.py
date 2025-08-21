import json
import sys
sys.path.insert(0, '..')

import tinytroupe
from tinytroupe.agent import TinyPerson
from tinytroupe.environment import TinyWorld, TinySocialNetwork
from tinytroupe.examples import *

lisa = TinyPerson.load_specification("./agents/Lisa.agent.json")  # Lisa, the data scientist
oscar = TinyPerson.load_specification("./agents/Oscar.agent.json")  # Oscar, the architect

world = TinyWorld("Chat Room", [lisa, oscar])
world.make_everyone_accessible()

lisa.listen("Talk to Oscar to know more about him")
world.run(4)

lisa.pp_current_interactions()
oscar.pp_current_interactions()

