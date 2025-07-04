#!/bin/bash

if [ ! -d "${HOME}/.cache/ms-playwright" ] || [ -z "$(ls -A "${HOME}"/.cache/ms-playwright)" ]; then
    playwright install
fi

python3.11 -m gunicorn app:app -w 1 --threads 8 --worker-class gevent -b 127.0.0.1:5000 --timeout 120