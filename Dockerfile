FROM maven:latest AS build
WORKDIR app
COPY . .
RUN mvn -DskipTests clean package

FROM openjdk:25-jdk
WORKDIR app
EXPOSE 8080
COPY --from=build /app/target/*.jar ./app.jar
ENTRYPOINT ["java", "-jar", "./app.jar"]