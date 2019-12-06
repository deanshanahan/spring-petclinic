FROM openjdk:12-alpine AS builder
COPY . /app
WORKDIR /app
RUN ./mvnw package -q

FROM openjdk:12-alpine
COPY --from=builder /app/target /app
CMD ["java", "-jar", "/app/*.jar"]  
