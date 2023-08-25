pipeline {
    agent any
    
    environment {
        DOCKER_PASSWORD=credentials('DOCKERHUB_CREDS')
        DOCKER_USERNAME="wissenbaba"
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], 
                          userRemoteConfigs: [[url: 'https://github.com/shailednrapali/spring-petclinic.git']]])
            }
        }

        stage('Build') {
            steps {
                sh '/usr/share/maven/bin/mvn clean compile package'
            }
        }

         stage('Dockerhub login') {
            steps {
                sh 'echo $DOCKER_PASSWORD |sudo docker login -u $DOCKER_USERNAME --password-stdin'
            }
        }
    }
}

