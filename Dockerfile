FROM openjdk:alpine

RUN mkdir -p /opt/terraform-ui

ENV JAVA_OPTS="-Xms128m -Xmx128m -server"
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /opt/terraform-ui/app.jar" ]

EXPOSE 8090

ARG JAR_VERSION=1.0

COPY build/libs/terraform-ui-${JAR_VERSION}.jar /opt/terraform-ui/app.jar

RUN touch /opt/terraform-ui/app.jar