# app/Dockerfile

FROM python:3.11-slim as base

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install pip-tools
COPY ./pyproject.toml .

FROM base as pip-service

COPY ./requirements.txt .
RUN pip3 install -r requirements.txt

FROM pip-service as service-setup
EXPOSE 8501
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health
ENTRYPOINT ["./start.sh"]

FROM pip-service as service
WORKDIR /app/src
COPY ./src .

FROM service-setup as development
WORKDIR /app
COPY ./dev-requirements.txt .
RUN pip3 install -r dev-requirements.txt

WORKDIR /app/src