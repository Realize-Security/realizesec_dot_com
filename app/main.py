from fastapi import FastAPI

from .routers import services, welcome

app = FastAPI()

app.include_router(services.router)
app.include_router(welcome.router)


@app.get("/")
def root():
    return welcome.welcome()