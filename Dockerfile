# Use official Maven image to build the app
FROM maven:3.9.9-eclipse-temurin-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Use JDK runtime to run the app
FROM eclipse-temurin:11-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
