node {
    def buildNumber = BUILD_NUMBER

    stage("Git CheckOut") {
        git url: 'https://github.com/shailednrapali/spring-petclinic.git', branch: 'main'
    }

    stage("Maven Clean Package") {
        sh "/usr/share/maven/bin/mvn clean install package" // Use double quotes here
        }

    stage("Build Docker Image") {
        sh "docker build -t wissenbaba/petclinic:${buildNumber} ."
    }

    stage("Docker Login and Push Image in Docker Hub") {
        withCredentials([string(credentialsId: 'Docker_Hub_PWD', variable: 'Docker_Hub_PWD')]) {
            sh "docker login -u wissenbaba -p ${Docker_Hub_PWD}"
        }
        sh "docker push wissenbaba/petclinic:${buildNumber}"
    }
}
