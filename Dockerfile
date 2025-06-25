FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app.py app.py

EXPOSE 90

CMD ["python", "app.py"]

