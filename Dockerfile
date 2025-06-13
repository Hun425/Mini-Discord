# Multi-stage build for spring boot application
FROM gradle:8.1.1-jdk17 AS build
WORKDIR /workspace
COPY . .
RUN ./gradlew bootJar

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /workspace/build/libs/*.jar /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]
