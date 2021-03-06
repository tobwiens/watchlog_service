FROM java:8-jdk

RUN apt-get update && apt-get install -y \ 
	git

ENV WATCHLOG_HOME /data/watchlog
WORKDIR $WATCHLOG_HOME

# Clone master, build master, copy fatjar, delete project
RUN 	mkdir --parents $WATCHLOG_HOME && \
	git clone https://github.com/tobwiens/watchlog_service.git && \
	chmod +x $WATCHLOG_HOME/watchlog_service/gradlew && \ 
	cd $WATCHLOG_HOME/watchlog_service/ && \
	$WATCHLOG_HOME/watchlog_service/gradlew shadowJar && \
	mv $WATCHLOG_HOME/watchlog_service/build/libs/*jar $WATCHLOG_HOME && \
	rm -fr $WATCHLOG_HOME/watchlog_service/

EXPOSE 8080

ENTRYPOINT ["/bin/bash", "-c","java -jar *.jar"]