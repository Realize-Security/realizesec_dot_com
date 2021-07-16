FROM tiangolo/uvicorn-gunicorn:python3.8-alpine3.10

LABEL maintainer="Realize Security Ltd."

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# Create virtualenv path and add to front of $PATH
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY ./requirements.txt /requirements.txt 
COPY ./app /app
COPY ./scripts /scripts

EXPOSE 5000

RUN python3 -m pip install --upgrade pip && \
    apk add --no-cache --virtual .build-deps gcc libc-dev make && \
    pip install --no-cache-dir "uvicorn[standard]" && \
    apk del .build-deps gcc libc-dev make && \
    pip install -r /requirements.txt && \
    adduser --disabled-password --no-create-home rsecuser && \
    chmod -R 0775 /app && \
    chmod -R 0775 /scripts

WORKDIR /app
USER rsecuser

CMD ["/scripts/run.sh"]
