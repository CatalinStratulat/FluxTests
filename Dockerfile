FROM python:3.10-slim-buster

RUN mkdir /server
COPY src/*.py /server/

COPY requirements.txt /tmp/

RUN apt-get update && apt-get install -y git procps && \
  pip install --upgrade pip && pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /server
#CMD ["uvicorn", "gitops_adapter:app","--host", "0.0.0.0", "--port", "80"]
