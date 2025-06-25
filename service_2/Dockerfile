FROM python:3.12-slim-bookworm

WORKDIR /app

RUN pip install uv

COPY pyproject.toml uv.lock ./

# Install ALL dependencies from lock file (default behavior)
RUN uv sync

COPY . .

EXPOSE 8002

CMD ["uv", "run", "app.py", "--host=0.0.0.0", "--port=8002"]