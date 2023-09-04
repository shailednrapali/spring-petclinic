# Use the official OpenJDK 11 image as the base image
FROM openjdk:17

# Create a directory in the container to copy the WAR file into
WORKDIR /home/ubuntu/.jenkins/workspace/First/

# Copy the webapp.war file from your local machine into the container
COPY /webapp/target/webapp.war .

# Command to run when the container starts
CMD ["java", "-jar", "webapp.war"]

EXPOSE 7070
