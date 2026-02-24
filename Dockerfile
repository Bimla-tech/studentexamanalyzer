# Use Maven image to build
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Use lightweight JDK image to run
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app
COPY --from=build /app/target/studentexamanalyzer.jar app.jar

EXPOSE 8080

CMD ["sh", "-c", "java -jar app.jar --server.port=$PORT"]
