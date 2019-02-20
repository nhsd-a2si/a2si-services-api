FROM python:3
ENV PYTHONUNBUFFERED 1
WORKDIR /code
COPY requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt
ENTRYPOINT ["pycodestyle"]
