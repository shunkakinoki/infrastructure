# Base Image Python
FROM python:3-slim-stretch

# Install Pipenv
RUN pip3 install pipenv

# Create a `app` Working Directory
RUN mkdir /app
WORKDIR /app

# Copying Pipfile & Pipfile.lock & label_app.py
COPY Pipfile Pipfile
COPY Pipfile.lock Pipfile.lock
COPY gha/label_app.py label_app.py

# Install Dependencies
RUN set -ex && pipenv sync --dev

# Run Python Script
ENTRYPOINT ["pipenv", "run" "label_app.py"]