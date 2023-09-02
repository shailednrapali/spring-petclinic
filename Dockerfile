FROM eclipse-temurin:17-jdk-alpine

# Create the appuser group
RUN groupadd appuser

# Create the faltu user, set the home directory, and add to the appuser group
RUN useradd -m -g appuser faltu

USER faltu
WORKDIR /home/faltu

COPY *.jar app.jar

#RUN chown -R $user:$user /home/$user/

#RUN chmod -R 755 /home/$user/

EXPOSE 8080

#ENTRYPOINT ["java","-jar","-Dspring.profiles.active=mysql","/app.jar"]
