pipeline {
    agent any
    
    environment {
        DOCKER_PASSWORD=credentials('DOCKER_PASSWORD')
        dockerhub_repo="sharath2787"
        DOCKER_USERNAME="sharath2787"
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

