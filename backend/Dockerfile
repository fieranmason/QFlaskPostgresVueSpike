# latest python
FROM python:3.7-alpine

RUN apk update
RUN apk upgrade
RUN apk add openssh
RUN apk add git

RUN adduser -D backend

WORKDIR /home/backend

###Provision###

#virtual env#

#end virtual env#

#application, configuration, dependencies, webserver#
RUN git clone https://github.com/fieranmason/QFlaskView.git
ENV FLASK_APP app
COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn
#end application and configuration#

#entry point with permissions
COPY ./boot.sh ./
RUN chmod 744 boot.sh
#entry point#

#ownership#
RUN chown -R backend:backend .
#end ownership#

EXPOSE 5000

USER backend

ENTRYPOINT ["./boot.sh"]
