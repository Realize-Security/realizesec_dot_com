from fastapi.testclient import TestClient

from main import app

client = TestClient(app)

COPYRIGHTS = 'All Rights Reserved by Realize Security Ltd.'

# Navigating to '/' should return the home page
def test_root_to_is_home():
    response = client.get("/")
    assert(response.status_code == 200)
    assert 'Welcome to Realize Security' in response.text
    assert COPYRIGHTS in response.text


def test_home():
    response = client.get("/home")
    assert(response.status_code == 200)
    assert 'Welcome to Realize Security' in response.text
    assert COPYRIGHTS in response.text


def test_about():
    response = client.get("/about")
    assert(response.status_code == 200)
    assert 'Who we are' in response.text
    assert 'Our Mission' in response.text
    assert 'What We Do' in response.text
    assert 'Test testimonial' in response.text
    assert COPYRIGHTS in response.text


def test_contact():
    response = client.get("/contact")
    assert(response.status_code == 200)
    assert 'info@realizesec.com ' in response.text
    assert COPYRIGHTS in response.text