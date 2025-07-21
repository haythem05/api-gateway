
# Stage 1: Build the application

FROM maven:3.8.4-openjdk-17-slim AS build

WORKDIR /app

COPY ./pom.xml ./
COPY ./src ./src

RUN mvn clean package -DskipTests


# Stage 2: Run the application
FROM eclipse-temurin:17-jdk-jammy


WORKDIR /app


COPY --from=build /app/target/*.jar ./app.jar


CMD ["java", "-jar", "app.jar"]
