pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
                script {
                    BRANCH = sh(script: "git rev-parse --abbrev-ref HEAD", returnStdout: true).trim()
                    echo "Current Branch: ${BRANCH}"
                }
            }
        }

        stage('Build') {
            steps {
                echo "Building application on branch: ${BRANCH}"
            }
        }

        stage('Test') {
            steps {
                echo "Testing application on branch: ${BRANCH}"
            }
        }

        stage('Prod Deploy') {
            when {
                expression { BRANCH == "master" }
            }
            steps {
                echo "Deploying to Production (only for master branch)"
            }
        }
    }
}
