FROM python:3.9-alpine

LABEL maintainer="Realize Security Ltd."

ENV export PYTHONDONTWRITEBYTECODE=1
ENV export PYTHONUNBUFFERED=1

COPY ./requirements.txt /requirements.txt
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install -r /requirements.txt

COPY ./rsec /rsec

RUN adduser -D user
USER user