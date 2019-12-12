FROM openjdk:12-alpine AS builder
COPY . /app
WORKDIR /app
RUN ./mvnw package -DskipTests

FROM openjdk:12-alpine
COPY --from=builder /app/target /app
WORKDIR /app
ENV GOOGLE_APPLICATION_CREDENTIALS=/credential.json
ENTRYPOINT ["sh", "-c", "echo $GCP_SERVICE_KEY > /credential.json && java -jar spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar"]  
