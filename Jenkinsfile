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
    stage('Deploy to EKS K8S'){
      steps{
        script{
          docker.withRegistry("https://" + registry, "ecr:us-east-1:" + registryCredential) {
          //kubernetesDeploy(
            //configs: 'demonginx.yaml', 
            //kubeconfigId: 'Kubeconfig',
            //enableConfigSubstitution: true)
            sh"""
            docker pull 181300079289.dkr.ecr.us-east-1.amazonaws.com/demopoc1":$BUILD_NUMBER"
            kubectl apply -f ./demongnix.yaml
            """
          }
        }
     }
  }
}
}
