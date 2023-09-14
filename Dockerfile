FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app
 
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve
COPY src ./src

#EXPOSE 7070

#CMD ["java", "-jar", "*.jar"]
CMD ["./mvnw", "-Dspring-boot.run.profiles=mysql", "spring-boot:run"]
#CMD ["./mvnw", "spring-boot:run"]




