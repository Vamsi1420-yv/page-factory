# Use JDK 8 with Maven (Temurin is a stable OpenJDK distribution)
FROM maven:3.9.6-eclipse-temurin-8 AS build

# Set working directory inside the container
WORKDIR /app

# Copy your source code and pom.xml into the container
COPY . .

# Purge local repository (optional, but helps with Lombok and version conflicts)
RUN mvn dependency:purge-local-repository -DactTransitively=false -DreResolve=false

# Clean and build the project, skipping tests for faster builds
RUN mvn clean install -DskipTests

# Final image to run the built jar
FROM eclipse-temurin:8-jre

WORKDIR /app

# Copy compiled jar from build stage (adjust path to your actual jar)
COPY --from=build /app/target/*.jar app.jar

# Default command to run the application
CMD ["java", "-jar", "app.jar"]
