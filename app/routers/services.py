from fastapi import APIRouter

router = APIRouter()

@router.get("/api/services")
def services():
    return {"services": [
        "Penetration testing",
        "Shenanigans"
    ]
}