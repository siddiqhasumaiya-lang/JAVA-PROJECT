# Fully qualified image name
FROM docker.io/eclipse-temurin:21-jdk-jammy

WORKDIR /app

# Copy the pre-built jar from Jenkins workspace
COPY target/myapp-1.0-SNAPSHOT.jar .

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "myapp-1.0-SNAPSHOT.jar"]
