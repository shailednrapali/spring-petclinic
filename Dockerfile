#FROM eclipse-temurin:17-jdk-alpine

#ARG user=appuser
#ARG group=appuser

#RUN addgroup -S appuser && adduser -S $user -G appuser

#COPY *.jar app.jar

#RUN chown -R $user:$user /home/$user/

#RUN chmod -R 755 /home/$user/

#EXPOSE 8080

#WORKDIR /home/$user

#ENTRYPOINT ["java","-jar","-Dspring.profiles.active=mysql","/app.jar"]



FROM eclipse-temurin:17-jdk-jammy
 
WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve

COPY src ./src

#CMD ["./mvnw", "-Dring.profiles.active=mysql", "spring-boot:run"]
#CMD ["./mvnw", "spring-boot:run", "-Dspring.profiles.active=mysql"]
CMD ["./mvn", "-Dspring-boot.run.profiles=mysql", "spring-boot:run"]