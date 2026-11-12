pipeline {
    agent { label 'minikube' }

    parameters {
        booleanParam(name: 'FORCE_RELEASE', defaultValue: false, description: 'Deploy even if today is not the 25th (for testing)')
    }

    environment {
        IMAGE = 'abhaygoku/capstone-website'
    }

    stages {
        stage('Build image') {
            steps {
                sh 'docker build -t $IMAGE:$BUILD_NUMBER -t $IMAGE:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DH_USER', passwordVariable: 'DH_TOKEN')]) {
                    sh 'echo "$DH_TOKEN" | docker login -u "$DH_USER" --password-stdin'
                    sh 'docker push $IMAGE:$BUILD_NUMBER'
                    sh 'docker push $IMAGE:latest'
                }
            }
        }

        stage('Release on the 25th') {
            when {
                expression { new Date().format('d') == '25' || params.FORCE_RELEASE }
            }
            steps {
                sh 'kubectl set image deployment/website website=$IMAGE:$BUILD_NUMBER'
                sh 'kubectl rollout status deployment/website --timeout=120s'
            }
        }
    }

    post {
        always {
            sh 'docker logout || true'
        }
    }
}
