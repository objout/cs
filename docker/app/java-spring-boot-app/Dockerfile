FROM eclipse-temurin:17-jdk AS build

WORKDIR /src

COPY . /src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=build /src/target/*.jar app.jar
COPY run-java-app.sh /app

EXPOSE 8080

CMD ["bash", "run-java-app.sh"]
