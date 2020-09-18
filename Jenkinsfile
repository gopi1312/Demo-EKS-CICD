pipeline {
  environment {
    registry = '181300079289.dkr.ecr.us-east-1.amazonaws.com/demopoc1'
    registryCredential = '9abff34a-26ce-4675-99d2-3939277c5784'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Push image') {
        steps{
            script{
                docker.withRegistry("https://" + registry, "ecr:us-east-1:" + registryCredential) {
                    dockerImage.push()
                }
            }
        }
    }
    stage('Deploy App'){
      steps{
        scripts{
          sh'kubectl apply -f demongnix.yaml'  
        }
     }
  }
}
