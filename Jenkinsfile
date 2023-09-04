node {
    def buildNumber = BUILD_NUMBER

    stage("Git CheckOut") {
        git url: 'https://github.com/shailednrapali/spring-petclinic.git', branch: 'main'
    }

    stage("Maven Clean Package") {
        withMaven(
            maven: 'Maven 3.6.3',
            mavenSettingsConfig: 'YourMavenSettings' // Replace with the correct Maven settings if needed
        ) {
            sh 'mvn clean package'
        }
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
