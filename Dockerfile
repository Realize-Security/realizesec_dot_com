FROM python:3.9-alpine

LABEL maintainer="Realize Security Ltd."

ENV export PYTHONDONTWRITEBYTECODE=1
ENV export PYTHONUNBUFFERED=1
ENV export FLASK_APP=app.py

RUN adduser -D dockeruser

WORKDIR /home/dockeruser

COPY . . 

RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install -r requirements.txt

RUN chown dockeruser:dockeruser ./
USER dockeruser

EXPOSE 5000

CMD ["python", "manage.py", "runserver"]