FROM maven:3.8.7-openjdk-11

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests

CMD ["java", "-jar", "target/your-app.jar"]
