pipeline {
    agent { label 'agent003' }

    environment {
        CURRENT_BRANCH = "${env.BRANCH_NAME}"
    }

    stages {
        stage('Clone') {
            steps {
                echo "Cloning branch: ${env.BRANCH_NAME}"
                // Already checked out automatically in multibranch jobs
            }
        }

        stage('Build') {
            steps {
                echo 'Building the Docker image'
                sh 'docker build -t jenkins-case-study:v1 .'
            }
        }

        stage('Deploy') {
            when {
                expression { env.BRANCH_NAME == 'master' }
            }
            steps {
                echo 'Deploying to port 82 because branch is master'
                sh '''
                    docker ps -q --filter "ancestor=jenkins-case-study:v1" | xargs -r docker stop
                    docker ps -aq --filter "ancestor=jenkins-case-study:v1" | xargs -r docker rm
                    docker run -d -p 82:80 jenkins-case-study:v1
                '''
            }
        }
    }
}
