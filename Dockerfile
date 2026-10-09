FROM python:3.11-slim@sha256:0dd364ba7e10242f07755449e3a3d0e35f9efd987952737b90def6709ab0c5ce

WORKDIR /app

RUN pip install --no-cache-dir pip==26.2.1 setuptools==83.0.0

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY vulnerable_examples.py /app/
COPY 41_scan_stream_default.py /app/

RUN useradd --create-home --uid 10001 appuser
USER appuser

CMD ["python3", "-c", "print('Container built successfully. Files present:'); import os; print(os.listdir('/app'))"]
