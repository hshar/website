pipeline {
  agent {label 'test'}

  stages {
    stage('Pull Source') {
      steps {
        git credentialsId: '9f90fb44-759e-41a6-abed-e7b3a7cb05bf', branch: 'develop', url: 'https://github.com/PKGITHUB90/website.git'
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
