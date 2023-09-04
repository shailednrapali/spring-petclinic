pipeline {
    agent any
    
    stages {
        stage('Git Checkout') {
            steps {
                git(url: 'https://github.com/shailednrapali/spring-petclinic.git', branch: 'main')
            }
        }

     stage("Maven Clean Package"){
      steps {
        def mavenHome = tool name: "mvn 3.6.3", type: "maven"
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package "        
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    def BUILD_NUMBER = env.BUILD_NUMBER
                    sh "docker build -t wissenbaba/petclinic:${BUILD_NUMBER} ."
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
                    sh "docker push wissenbaba/petclinic:${BUILD_NUMBER}"
                }
            }
        }
    }
}
