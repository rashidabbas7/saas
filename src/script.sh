#!/bin/bash
PORT="${PORT:-8000}"
python manage.py migrate --no-input
gunicorn ${PROJ_NAME}.wsgi:application --bind [::]:$PORT
