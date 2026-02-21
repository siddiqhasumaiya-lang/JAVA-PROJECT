# Use full path for base image to avoid short-name TTY issues
FROM docker.io/library/maven:3.9.9-eclipse-temurin-21 AS builder

# Set working directory
WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build the Java application
RUN mvn clean package -DskipTests

# Final stage for minimal image
FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

# Copy the built jar from builder stage
COPY --from=builder /app/target/myapp-1.0-SNAPSHOT.jar .

# Expose port if needed
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "myapp-1.0-SNAPSHOT.jar"]
