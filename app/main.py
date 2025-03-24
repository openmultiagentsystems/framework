from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

from .routers import agents

app = FastAPI()

app.mount("/site", StaticFiles(directory="site", html = True), name="site")


app.include_router(agents.router)
