import pytest

from rsec import app

def test_title():
    response = app.test_client().get("/")
    assert response.status_code == 200
    assert response.data == b"Hello world"