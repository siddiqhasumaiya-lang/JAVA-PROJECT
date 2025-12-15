# =========================
# Stage 1: Build the app
# =========================
FROM maven:3.9.9-eclipse-temurin-21 AS builder

WORKDIR /build

# Copy pom.xml first (better cache)
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests


# =========================
# Stage 2: Run the app
# =========================
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copy JAR from build stage
COPY --from=builder /build/target/*.jar app.jar

# Expose application port
EXPOSE 8080

# Run Java application
ENTRYPOINT ["java", "-jar", "app.jar"]
