FROM maven:3.8.8-jdk-11

WORKDIR /app
COPY . .

RUN mvn clean install -DskipTests

CMD ["java", "-jar", "target/your-app.jar"]
