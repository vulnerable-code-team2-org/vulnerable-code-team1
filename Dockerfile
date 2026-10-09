FROM python:3.12-slim@sha256:05cda9777409a9c3ffddd94a4c476b79f0769a0b4857f0c7ed9226b6800b0d6f

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY vulnerable_examples.py /app/
COPY 41_scan_stream_default.py /app/

RUN useradd --create-home --uid 10001 appuser
USER appuser

CMD ["python3", "-c", "print('Container built successfully. Files present:'); import os; print(os.listdir('/app'))"]
