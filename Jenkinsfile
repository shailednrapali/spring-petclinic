node{
    def buildNumber = BUILD_NUMBER
    stage("Git CheckOut"){
        git url: 'https://github.com/shailednrapali/spring-petclinic.git', branch: 'main'
    }

   
    stage("Maven Clean Package"){
        def mavenHome = tool name: "mvn 3.6.3", type: "maven"
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package "
  }
}		
    
    stage("Build Docker Image") {
         sh "docker build -t wissenbaba/petclinic:${buildNumber} ."
    }
    
    stage("Docker Login and Push Image in Docker Hub") {
        withCredentials([string(credentialsId: 'Docker_Hub_PWD', variable: 'Docker_Hub_PWD')]) {
           sh "docker login -u wissenbaba -p ${Docker_Hub_PWD}"
     }
      sh "docker push  wissenbaba/petclinic:${buildNumber} "
    }
}
