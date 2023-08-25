pipeline {
    agent any
    
      
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
                sh 'echo Password@123 |sudo docker login -u wissenbaba --password-stdin'
            }
        }
    }
}

