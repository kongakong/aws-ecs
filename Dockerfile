FROM ubuntu:16.04

RUN apt-get update -y --fix-missing
RUN apt-get install -y git python python-pip cron ntp

ENV APP_HOME /docverter

RUN mkdir -p ${APP_HOME}
COPY . ${APP_HOME}

# To assist development
# RUN apt-get install -y vim screen
# ADD . /app/dev

RUN pip install -r ${APP_HOME}/requirements.txt -t ${APP_HOME}/lib

#
# Log configuration

RUN mkdir -p /root/.aws
RUN mkdir -p /var/awslogs/state
COPY ./credentials /root/.aws/credentials
COPY docker-cmd.sh /docker-cmd.sh

RUN apt-get install -y curl
RUN curl https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py -O
RUN python awslogs-agent-setup.py --non-interactive -c ${APP_HOME}/aws-log.cfg --region ap-southeast-2

CMD [ "/docker-cmd.sh" ]
