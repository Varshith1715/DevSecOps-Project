FROM openjdk:8-jre-alpine
LABEL maintainer="Varshith"

# Download Jetty Runner
ADD https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-runner/9.4.43.v20210629/jetty-runner-9.4.43.v20210629.jar /jetty-runner.jar

# Copy WAR file into the container
COPY ./taxi-booking/target/taxi-booking-1.0.1.war /app/taxi-booking.war

EXPOSE 8080

# Run WAR using Jetty Runner
CMD ["java", "-jar", "/jetty-runner.jar", "/app/taxi-booking.war"]
