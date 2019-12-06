FROM openjdk:12-alpine AS builder
COPY . /app
WORKDIR /app
ARG GOOGLE_APPLICATION_CREDENTIALS=/app/petclinic-key.json
RUN ./mvnw package -DskipTests

FROM openjdk:12-alpine
COPY --from=builder /app/target /app
COPY --from=builder /app/petclinic-key.json /app/petclinic-key.json
WORKDIR /app
ENV GOOGLE_APPLICATION_CREDENTIALS=/app/petclinic-key.json
CMD ["java", "-jar", "spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar"]  
