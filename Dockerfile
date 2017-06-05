FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install -y vim python git python-pip

ENV APP_HOME /app/test

RUN mkdir -p ${APP_HOME}
COPY . ${APP_HOME}

ADD . /app/dev

# RUN pip install -r {APP_HOME}/requirements.txt -t {APP_HOME}/lib

