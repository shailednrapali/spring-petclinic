FROM eclipse-temurin:17-jdk-jammy
 
WORKDIR /var/lib/jenkins/workspace/First/
#WORKDIR /var/lib/jenkins/

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve

#COPY src ./src
COPY *.jar app.jar

#CMD ["./mvnw", "-Dspring-boot.run.profiles=mysql", "spring-boot:run"]
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=mysql","/app.jar"]
