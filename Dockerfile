FROM gradle:8.0.7-jdk20-alpine AS build
COPY --chown=gradle:gradle app/src/main/java/hello_world_java /home/gradle/src
RUN gradle build --no-daemon
FROM openjdk:20-jdk-oracle
COPY /app/build/libs/app.jar /app/app.jar
ENTRYPOINT ["java", "-cp", "/app/app.jar", "hello_world_java.App"]
