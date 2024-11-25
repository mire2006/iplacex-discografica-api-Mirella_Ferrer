FROM gradle:jdk21 as builder

WORKDIR /app

COPY ./build.gradle .
COPY ./settings.gradle .

COPY src ./src 


FROM openjdk:21-jdk-slim

WORKDIR /app

COPY --from=builder /app/build/libs/discografia-1.jar discografia-1.jar 

EXPOSE 443

CMD ["java", "-jar", "discografia-1.jar"]
