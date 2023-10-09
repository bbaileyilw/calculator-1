FROM openjdk:8-jdk as builder
COPY . .
RUN ./gradlew build

FROM openjdk:8-jre
COPY --from=builder build/libs/calculator-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]