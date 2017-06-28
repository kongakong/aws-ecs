FROM ubuntu:16.04

RUN apt-get update -y --fix-missing
RUN apt-get install -y git python python-pip cron ntp

ENV APP_HOME /docverter

RUN mkdir -p ${APP_HOME}
COPY . ${APP_HOME}

# To assist development
#
# RUN apt-get install -y vim screen
# ADD . /app/dev

RUN pip install -r ${APP_HOME}/requirements.txt -t ${APP_HOME}/lib

# AWS  Log configuration
#
RUN mkdir -p /root/.aws
RUN mkdir -p /var/awslogs/state
COPY ./credentials /root/.aws/credentials
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT /docker-entrypoint.sh

