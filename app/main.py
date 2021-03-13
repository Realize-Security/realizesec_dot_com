from fastapi import FastAPI

app = FastAPI()

@app.get("/api/welcome")
def welcome():
    return {"welcomeMessage": "Welcome to Realize Security"}


@app.get("/api/services")
def services():
    return {"services": [
        "Penetration testing",
        "Shenanigans"
    ]
}
