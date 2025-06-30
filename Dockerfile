# Example Dockerfile
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY . .
RUN ./mvnw clean install -DskipTests
CMD ["java", "-jar", "target/your-app.jar"]
