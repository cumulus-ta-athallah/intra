#!/bin/bash

python manage.py collectstatic --noinput --clear
python manage.py migrate
gunicorn django_react_proj.wsgi --bind=0.0.0.0:80
