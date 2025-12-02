pipeline {
  agent { label 'linux' }

  environment {
    IMAGE_NAME = "docker8098/test"
    IMAGE_TAG = "v${BUILD_NUMBER}"
    PROD_SERVER = "devops@98.81.86.76"
  }
  stages{
    stage('checkout') {
      steps {
        checkout scm
      }
    }
    stage('testing'){
      steps {
        sh 'echo We are testing this code'
      }
    }
    stage('Docker build'){
      steps {
        sh "docker build . -t ${IMAGE_NAME}:${IMAGE_TAG}"
      }
    }
    stage('docker push') {
      when { branch 'main'}
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          sh """
          echo "${DOCKER_PASS}" | docker login -u "${DOCKER_USER}" --password-stdin
          docker push ${IMAGE_NAME}:${IMAGE_TAG}
          docker logout
          """
        }
      }
    }
    stage('Prod Deployment') {
      when { branch 'main' }
      steps {
        sshagent(credentials: ['prod-server-ssh']) {
          sh """
            ssh -o StrictHostKeyChecking=no ${PROD_SERVER} "
              docker pull ${IMAGE_NAME}:${IMAGE_TAG} &&
              docker stop web || true &&
              docker rm web || true &&
              docker run -d --name web -p 80:80 ${IMAGE_NAME}:${IMAGE_TAG}
            "
          """
        }
      }
    }
  }
}
