FROM maven:3.9.8-eclipse-temurin-17 AS build
WORKDIR /src
COPY . .
RUN mvn -B -DskipTests clean package

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /src/target/*SNAPSHOT.jar /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]
