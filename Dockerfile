FROM java:8-jre

ENV WATCHLOG_HOME /data/Watchlog_Service

RUN apt-get update -y && /
    apt-get install git -y

WORKDIR $WATCHLOG_HOME

# Clone master, build master, copy fatjar, delete project
RUN mkdir $WATCHLOG_HOME && /
    git clone https://github.com/tobwiens/watchlog_service.git && /
    $WATCHLOG_HOME/watchlog_service/gradlew shadowJar && /
    mv watchlog_service/build/libs/*jar $WATCHLOG_HOME && /
    rm -fr watchlog_service

ENTRYPOINT ["java", "-jar", "$WATCHLOG_HOME/*jar"]
