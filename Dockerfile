#FROM eclipse-temurin:17-jdk-jammy
FROM openjdk:17
 
WORKDIR /var/lib/jenkins/workspace/First/
#WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve

COPY src ./src

#CMD ["./mvnw", "-Dspring-boot.run.profiles=mysql", "spring-boot:run"]
