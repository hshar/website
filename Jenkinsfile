pipeline {
    agent any

    environment {
        IMAGE_REPO = 'sujalkumar0410/my-website'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker image') {
            steps {
                sh 'docker build -t $IMAGE_REPO:$BUILD_NUMBER -t $IMAGE_REPO:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKERHUB_USER',
                    passwordVariable: 'DOCKERHUB_TOKEN'
                )]) {
                    sh '''
                        echo "$DOCKERHUB_TOKEN" | docker login --username "$DOCKERHUB_USER" --password-stdin
                        docker push "$IMAGE_REPO:$BUILD_NUMBER"
                        docker push "$IMAGE_REPO:latest"
                        docker logout
                    '''
                }
            }
        }
    }
}
