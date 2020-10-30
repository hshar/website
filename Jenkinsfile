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
                build 'dockerpush2'
            }
        }
        stage('Prod') {
            when {
                branch 'master' 
            }
            steps {
                build 'Prod'
            }
        }
    }
}
