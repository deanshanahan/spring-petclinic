FROM openjdk:14-alpine AS builder
COPY . /app
WORKDIR /app
RUN ./mvnw package

FROM openjdk:14-alpine
COPY --from=builder /app/target /app
CMD ["java", "-jar", "/app/*.jar"]  
