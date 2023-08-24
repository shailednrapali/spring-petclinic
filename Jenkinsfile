pipeline {
    agent any

     
    stages {
        stage('Build Maven package') {
            steps {
                sh '/usr/local/src/apache-maven/bin/mvn clean install'
            }
        }


