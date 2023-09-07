pipeline {
    agent any

    environment {
        MAVEN_HOME = tool name: "mvn 3.9.3", type: "maven"
    }

    stages {
        stage("Git CheckOut") {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/shailednrapali/spring-petclinic.git']]])
            }
        }

        stage("Maven Clean Package") {
            steps {
                sh "${MAVEN_HOME}/bin/mvn clean package"
            }
        }

        stage("Build Docker Image") {
            steps {
                sh "docker build -t wissenbaba/petclinic:spc-\${BUILD_NUMBER} ."
            }
        }

        stage("Docker Login and Push Image in Docker Hub") {
            steps {
                withCredentials([string(credentialsId: 'Docker_Hub_PWD', variable: 'Docker_Hub_PWD')]) {
                    sh "docker login -u wissenbaba -p \${Docker_Hub_PWD}"
                }
                sh "docker push wissenbaba/petclinic:spc-\${BUILD_NUMBER}"
            }
        }
    }
}
