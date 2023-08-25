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

         stage('Build docker image') {
            steps {
                sh 'cp -p /home/ubuntu/Dockerfile /home/ubuntu/.jenkins/workspace/First/target/'
                sh 'cd /home/ubuntu/.jenkins/workspace/First/target/; sudo docker build -t petclinic .'
            }
        }
        
		  stage('Dockerhub login') {
            steps {
                sh 'echo Password@123 |sudo docker login -u wissenbaba --password-stdin'
            }
        }
    }
}

