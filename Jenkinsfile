pipeline {
  agent { label 'linux' }

  environment {
    IMAGE_NAME = "docker8098/test"
    IMAGE_TAG = "v${BUILD_NUMBER}"
    PROD_SERVER = "54.152.240.126"
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
      when { branch 'master'}
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
    Stage('Prod Deployment') {
      when { branch 'master' }
      steps {
        withCredentials([usernamePassword(credentialsId: 'prod-server-creds', usernameVariable: 'SSH_USER', passwordVariable: 'SSH_PASS')]) {
          sh """
            sshpass -p "$SSH_PASS" ssh -o StrictHostKeyChecking=no $SSH_USER@$PROD_SERVER "
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
