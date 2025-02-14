pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "arun1818/jenkins-casestudy:latest"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'develop', url: 'https://github.com/marun1818/case-study.git'
            }
        }

        stage('Build Code') {
            steps {
                sh 'docker run --rm -v $PWD:/var/www/html $DOCKER_IMAGE'
            }
        }

        stage('Deploy to Apache (Master Branch)') {
            when {
                branch 'master'
            }
            steps {
                sh 'docker run -d -p 82:80 -v $PWD:/var/www/html $DOCKER_IMAGE'
            }
        }
    }
}
