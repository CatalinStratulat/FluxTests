FROM python:3.10-slim-buster

LABEL descripton="SWLCM - Gitops Git Service"
#LABEL version="0.1.0"

RUN mkdir /gitsvc
COPY src/*.py /gitsvc/

COPY requirements.txt /tmp/

RUN apt-get update && apt-get install -y git procps && \
  pip install --upgrade pip && pip install --no-cache-dir -r /tmp/requirements.txt


WORKDIR /gitsvc
#CMD ["uvicorn", "gitops_adapter:app","--host", "0.0.0.0", "--port", "80"]
