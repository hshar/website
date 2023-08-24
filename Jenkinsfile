pipeline{
    agent any 
    environment{
        VERSION = "${env.BUILD_ID}"
    }
    stages{
        stage(" code compile "){
            agent any
            steps{
                 echo 'Successful code compile'
            }
        }
        stage(" code quality check "){
            agent {
                docker {
                    image 'ubuntu:latest'
                }
            }
            steps{
                 echo 'Successful code quality check'
            }
        }
        stage(" code unit test "){
            agent any
            steps{
                 echo 'Successful code review'
            }
        }
        stage(" code coverage "){
            agent any
            steps{
                 echo 'Successful code unit'
            }
        }
        stage(" Build docker image " ){
            steps{
                script{
                    sh  'docker build -f Dockerfile --tag vtong24/devstone1:latest .'
                }
            }    
        }
        stage(" Push image to Docker " ){
            steps{
                script{
                    withCredentials([string(credentialsId: 'DOCKER_HUB_P', variable: 'DOCKER_HUB_P')]) {
                        sh  'docker login -u vtong24 -p ${DOCKER_HUB_P}'
                        sh  'docker push vtong24/devstone1:latest'
                        sh  'docker rmi vtong24/devstone1:latest'

                    }
                }
            }
        }
        stage('Deploying devstone on k8s cluster') {
            steps {
                script{
                        sh 'kubectl apply -f deployment-svc.yaml --kubeconfig=/var/lib/jenkins/kconfig'
                }
            }
        }
    }
}
