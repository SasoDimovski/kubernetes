pipeline {
  environment {
    dockerimagename = "sasodimovski/kubernetes"
    dockerImage = ""
  }
  agent any
  stages {
    stage('Pull од GitHub') {
      steps {
        git 'https://github.com/SasoDimovski/kubernetes.git'
      }
    }
    stage('Build на Docker Image') {
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }
    stage('Push на DockerHub') {
      environment {
          registryCredential = 'kubernetes-dockerhub'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }
    stage('Deploy на апликација на Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deployment.yaml", "service.yaml")
        }
      }
    }
  }
}