FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8

LABEL maintainer="Realize Security Ld."

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install -r /requirements.txt

COPY ./app /app

