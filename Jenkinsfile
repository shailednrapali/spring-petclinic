pipeline {
    agent any

     
    stages {
        stage('clean Maven package') {
            steps {
                sh '/usr/share/maven/bin/mvn clean'
            }
        }
    }

    stages {
        stage('compile Maven code') {
            steps {
                sh '/usr/share/maven/bin/mvn compile'
            }
        }
    }

    stages {
        stage('Build Maven package') {
            steps {
                sh '/usr/share/maven/bin/mvn package'
            }
        }
    }
}

