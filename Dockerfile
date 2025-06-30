FROM openjdk:11-jdk-slim

RUN apt-get update && apt-get install -y maven && apt-get clean

WORKDIR /app
COPY . .

RUN mvn clean install -DskipTests

CMD ["java", "-jar", "target/your-app.jar"]
