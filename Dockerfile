FROM java:jdk-1.8

ENV WATCHLOG_HOME /data/Watchlog_Service

RUN apt-get update -y &&/
    apt-get install git -y

WORKDIR $WATCHLOG_HOME
RUN mkdir $WATCHLOG_HOME &&/
    git clone
