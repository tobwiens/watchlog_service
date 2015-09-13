FROM java:8-jre

RUN apt-get update && apt-get install -y \
	git

ENV WATCHLOG_HOME /data/watchlog
WORKDIR $WATCHLOG_HOME

# Clone master, build master, copy fatjar, delete project
RUN 	mkdir --parents $WATCHLOG_HOME && \
	git clone https://github.com/tobwiens/watchlog_service.git && \
	chmod +x $WATCHLOG_HOME/watchlog_service/gradlew && \
	$WATCHLOG_HOME/watchlog_service/gradlew shadowJar && \
	mv watchlog_service/build/libs/*jar $WATCHLOG_HOME && \
	rm -fr watchlog_service

#ENTRYPOINT ["java", "-jar", "$WATCHLOG_HOME/*jar"]
ENTRYPOINT ["/bin/bash"]
