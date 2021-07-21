#!/bin/sh

/bin/cp -r /app/static/* /vol/static
uvicorn main:app --host=0.0.0.0 --port=5000