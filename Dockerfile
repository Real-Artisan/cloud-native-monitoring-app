FROM python:3.9-slim-buster

WORKDIR /app

COPY requirments.txt .

RUN pip install --no-cache-dir -r requirments.txt

COPY . .

ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 3000

CMD [ "flask", "run" ]