FROM python:3.15-slim@sha256:65a65fc7b30b06cb6df4930fd4650697cb23f4c2698ab81fc87e4b031bc36928

WORKDIR /app

RUN pip install --no-cache-dir pip==26.2.1 setuptools==83.0.0

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY vulnerable_examples.py /app/
COPY 41_scan_stream_default.py /app/

RUN useradd --create-home --uid 10001 appuser
USER appuser

CMD ["python3", "-c", "print('Container built successfully. Files present:'); import os; print(os.listdir('/app'))"]
