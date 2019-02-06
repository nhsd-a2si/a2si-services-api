FROM python:3.5-alpine
ENV PYTHONUNBUFFERED 1
WORKDIR /code
COPY services/requirements.txt /code/
RUN pip install -r requirements.txt
