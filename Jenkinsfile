pipeline {
    agent any

    environment {
        DOCKERHUB = credentials('dockerhub')            // Jenkins stored credential ID
        IMAGE = "ankith222/webapp"                      // Your Docker Hub repo
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: "${env.BRANCH_NAME}", url: 'https://github.com/ankith2235/website.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE}:${env.BRANCH_NAME} ."
            }
        }

        stage('Test') {
            steps {
                echo "Simulated tests passed successfully!"
            }
        }

        stage('Push Docker Image') {
            when {
                anyOf { branch 'master'; branch 'develop' }
            }
            steps {
                sh """
                echo ${DOCKERHUB_PSW} | docker login -u ${DOCKERHUB_USR} --password-stdin
                docker push ${IMAGE}:${env.BRANCH_NAME}
                """
            }
        }

        stage('Deploy to Workers') {
            when {
                branch 'master'
            }
            steps {
                echo "Deploying application to worker nodes..."
                sh """
                ssh ubuntu@172.31.21.245 'docker stop webapp || true && docker rm webapp || true && docker run -d -p 80:80 --name webapp ${IMAGE}:${env.BRANCH_NAME}'
                ssh ubuntu@172.31.26.42 'docker stop webapp || true && docker rm webapp || true && docker run -d -p 80:80 --name webapp ${IMAGE}:${env.BRANCH_NAME}'
                ssh ubuntu@172.31.23.244 'docker stop webapp || true && docker rm webapp || true && docker run -d -p 80:80 --name webapp ${IMAGE}:${env.BRANCH_NAME}'
                """
            }
        }
    }

    post {
        success {
            echo "Build and Deployment Completed Successfully!"
        }
        failure {
            echo "Build or Deployment FAILED — Check logs!"
        }
    }
}
