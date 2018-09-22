# latest python
FROM python:3.7-alpine

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install git

RUN adduser -D backend
USER backend

WORKDIR /home/backend

#setup virtual env
RUN python -m venv venv

#install webserver
RUN venv/bin/pip install gunicorn


COPY ./boot.sh ./
RUN chmod 744 boot.sh

ENV FLASK_APP backend

EXPOSE 5000

ENTRYPOINT ["./boot.sh"]
