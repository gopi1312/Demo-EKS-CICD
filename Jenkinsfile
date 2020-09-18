pipeline {
  environment {
    registry = '181300079289.dkr.ecr.us-east-1.amazonaws.com/demopoc1'
    registryCredential = '9abff34a-26ce-4675-99d2-3939277c5784'
    dockerImage = ''
  }
  agent any
  stages {
    stage('scmcheckout'){
      steps{
        script{
            git credentialsId: '0acbfc46-6dad-4498-80bb-2d42c7ad84ec', url: 'https://github.com/gopi1312/Demo-EKS-CICD.git'
        }  
      }    
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('push image') {
        steps{
            script{
                docker.withRegistry("https://" + registry, "ecr:us-east-1:" + registryCredential) {
                    dockerImage.push()
                }
            }
        }
    }
  }
}
