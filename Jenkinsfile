pipeline {
  agent any

  stages {
    stage('Pull Source') {
      steps {
        git credentialsId: '20f144fd-f94d-4efe-a329-2e71cd2152d0', branch: ${env.BRANCH_NAME}, url: 'https://github.com/PKGITHUB90/website.git'
      }
    }
    stage('Stop Running Docker Container') {
      steps {
        sh 'sudo docker ps -f website-app -q | xargs --no-run-if-empty sudo docker container stop'
      }
    }
    stage('Remove Dangling Containers') {
      steps {
        sh 'sudo docker ps -q -f status=exited | xargs --no-run-if-empty sudo docker rm'
      }
    }
    stage('Remove Dangling Images') {
      steps {
        sh 'sudo docker images -q -f dangling=true | xargs --no-run-if-empty sudo docker rmi'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'sudo docker build -t website-image .'
      }
    }
    stage('Run Docker Image') {
      when {
        branch 'master'
      }
      steps {
        sh 'sudo docker run -d --name website-app -p 82:80 website-image'
      }
    }
  }
}
