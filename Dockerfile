FROM python:3.12.4-slim-bullseye

LABEL maintainer="Finlitvin <ros.litvin@gmail.com>"
LABEL description="finance_backend"
LABEL version="0.0.1"

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ENV APP_PATH=/finance_backend

ARG SECRET_KEY

WORKDIR $APP_PATH

COPY poetry.lock pyproject.toml $APP_PATH

RUN python -m pip install --no-cache-dir poetry==1.8.3
RUN poetry export --without-hashes --without dev -f requirements.txt -o requirements.txt

RUN python -m pip install --no-cache-dir -r requirements.txt

COPY app $APP_PATH/app

RUN echo "SECRET_KEY=$SECRET_KEY" >> .env

EXPOSE 8000

ENTRYPOINT ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]