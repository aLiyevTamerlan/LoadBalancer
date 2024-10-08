FROM python:3.11-slim

ENV POETRY_VERSION=1.8.2 \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=true

WORKDIR /app

RUN pip install "poetry==$POETRY_VERSION"
COPY requirements.txt /app/
RUN pip install -r requirements.txt

COPY pyproject.toml poetry.lock /app/

RUN poetry install --no-root --no-dev

COPY . /app

EXPOSE 8000

CMD ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]