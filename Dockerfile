FROM docker.io/library/maven:3.9.9-eclipse-temurin-21 AS builder
USER root
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests
