
It seems that you have configured Maven correctly on your EC2 instance, and you've also set up Jenkins to use Maven 3.6.3 with the correct tool name.

Given that the Maven tool is correctly configured in Jenkins as "Maven 3.6.3" with the name "/usr/share/maven," and you've confirmed that Maven 3.6.3 is available on your EC2 instance, there might be an issue with how Jenkins is detecting the tool in your pipeline.

Let's make sure that the tool is correctly referenced in your Jenkins pipeline:

groovy
Copy code
pipeline {
    agent any

    environment {
        // Use the correct tool name ("/usr/share/maven") from Jenkins Global Tool Configuration
        MAVEN_HOME = tool name: '/usr/share/maven', type: 'hudson.tasks.Maven$MavenInstallation'
    }

    stages {
        stage("Git CheckOut") {
            steps {
                git url: 'https://github.com/shailednrapali/spring-petclinic.git', branch: 'main'
            }
        }

        stage("Maven Clean Package") {
            steps {
                // Use the Maven tool defined in the environment
                sh "${MAVEN_HOME}/bin/mvn clean package"
            }
        }

        stage("Build Docker Image") {
            steps {
                // Build the Docker image
                sh "docker build -t wissenbaba/petclinic:${BUILD_NUMBER} ."
            }
        }

        stage("Docker Login and Push Image to Docker Hub") {
            steps {
                // Docker login and push image
                withCredentials([string(credentialsId: 'Docker_Hub_PWD', variable: 'Docker_Hub_PWD')]) {
                    sh "docker login -u wissenbaba -p ${Docker_Hub_PWD}"
                }
                sh "docker push wissenbaba/petclinic:${BUILD_NUMBER}"
            }
        }
    }
}
