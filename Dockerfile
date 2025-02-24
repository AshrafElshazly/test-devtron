FROM maven:3.8-openjdk-17 AS build
WORKDIR /usr/src/app
COPY . .
RUN mvn clean package

FROM openjdk:17
WORKDIR /usr/app
COPY --from=build /usr/src/app/target/demo-0.0.1-SNAPSHOT.jar .
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
