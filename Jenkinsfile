pipeline {
    agent any
    
    stages {
        stage('Git Checkout') {
            steps {
                git(url: 'https://github.com/shailednrapali/welcome.git', branch: 'master')
            }
        }
        
        stage('Maven Clean Package') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    def BUILD_NUMBER = env.BUILD_NUMBER
                    sh "docker build -t wissenbaba/welcome:${BUILD_NUMBER} ."
                }
            }
        }
        
        stage('Docker Login and Push') {
            steps {
                withCredentials([string(credentialsId: 'Docker_Hub_PWD', variable: 'Docker_Hub_PWD')]) {
                    sh "docker login -u wissenbaba -p ${Docker_Hub_PWD}"
                }
                script {
                    def BUILD_NUMBER = env.BUILD_NUMBER
                    sh "docker push wissenbaba/welcome:${BUILD_NUMBER}"
                }
            }
        }
    }
}
