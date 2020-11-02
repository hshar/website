pipeline {
    agent {
        label 'master'
    }
    stages {
        stage('Build') {
            steps {
                build 'Test'
            }
        }
        stage('Test') {
            steps {
                build 'Testurl'
            }
        }
        stage('hub-push') {
            steps {
                build 'DockerPush'
            }
        }
        stage('K8s-Deploy-Prod') {
            when {
                branch 'master' 
            }
            steps {
                build 'Prod'
            }
        }
    }
}
