FROM openjdk:17-jdk-slim

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean

WORKDIR /app
COPY . .

# Run build using installed Maven
RUN mvn clean install -DskipTests

# Update this with your actual jar name
CMD ["java", "-jar", "target/your-app.jar"]
