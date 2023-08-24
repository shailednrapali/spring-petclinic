pipeline {
    agent any

     
    stages {
        stage('Build Maven package') {
            steps {
                sh '/usr/share/maven/bin/mvn clean install'
            }
        }
    }
}

