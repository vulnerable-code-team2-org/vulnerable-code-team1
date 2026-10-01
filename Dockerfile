FROM python:3.11-slim

WORKDIR /app

COPY requirements /app/requirements
RUN pip install --no-cache-dir -r requirements

COPY vulnerable_examples.py /app/
COPY 41_scan_stream_default.py /app/

CMD ["python3", "-c", "print('Container built successfully. Files present:'); import os; print(os.listdir('/app'))"]
