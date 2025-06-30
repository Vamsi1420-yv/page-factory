FROM maven:3.9.6-eclipse-temurin-11

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests

CMD ["java", "-jar", "target/your-app.jar"]
