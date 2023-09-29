FROM eclipse-temurin:17.0.8.1_1-jdk

RUN groupadd -g 999 appuser \
	&& useradd -r -u 999 -g appuser appuser \
	&& mkdir -p /app/ \
	&& chown -R appuser:appuser /app

WORKDIR /azuredevopsapp
COPY app/build/libs/azuredevopsapp-0.0.1-SNAPSHOT.jar /azuredevopsapp


ENTRYPOINT exec java $JAVA_OPTS -jar azuredevopsapp-0.0.1-SNAPSHOT.jar


