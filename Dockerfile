# Use minimal JDK image
FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

# Copy the jar built by Jenkins
COPY target/myapp-1.0-SNAPSHOT.jar .

# Expose port if your app uses it
EXPOSE 8080

# Run the Java application
ENTRYPOINT ["java", "-jar", "myapp-1.0-SNAPSHOT.jar"]
