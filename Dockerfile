FROM eclipse-temurin:17-jdk-jammy
 
WORKDIR /var/lib/jenkins/workspace/First/target

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve

COPY src ./src

CMD ["./mvnw", "-Dspring-boot.run.profiles=mysql", "spring-boot:run"]
