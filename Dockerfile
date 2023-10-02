FROM python:3.11-slim as base

ENV APP_BASE_PATH="/app"
ENV APP_SRC_PATH=${APP_BASE_PATH}/src
ENV PYTHONPATH="${APP_SRC_PATH}:${PYTHONPATH}"
WORKDIR $APP_BASE_PATH

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
WORKDIR $APP_SRC_PATH
COPY ./src .

FROM service-setup as development
WORKDIR $APP_BASE_PATH
COPY ./dev-requirements.txt .
RUN pip3 install -r dev-requirements.txt

WORKDIR $APP_SRC_PATH
