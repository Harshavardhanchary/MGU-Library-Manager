##stage1
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

##stage2
FROM gcr.io/distroless/java17-debian11
ARG artifact=target/LibraryManager-0.0.1-SNAPSHOT.war
WORKDIR /app
COPY --from=build /app/target/LibraryManager-0.0.1-SNAPSHOT.war app.war

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.war"]
