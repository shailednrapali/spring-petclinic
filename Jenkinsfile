pipeline {
    agent any

    environment {
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
                sh "${MAVEN_HOME}/bin/mvn clean package"
            }
        }

        stage("Build Docker Image") {
            steps {
                sh "docker build -t wissenbaba/petclinic:${BUILD_NUMBER} ."
            }
        }

        stage("Docker Login and Push Image to Docker Hub") {
            steps {
                 withCredentials([string(credentialsId: 'Docker_Hub_PWD', variable: 'Docker_Hub_PWD')]) {
                    sh "docker login -u wissenbaba -p ${Docker_Hub_PWD}"
                }
                sh "docker push wissenbaba/petclinic:${BUILD_NUMBER}"
            }
        }
    }
}
