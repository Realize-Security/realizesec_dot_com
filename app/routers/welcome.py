from fastapi import APIRouter

router = APIRouter()

@router.get("/api/welcome")
def welcome():
    return {"welcomeMessage": "Welcome to Realize Security"}