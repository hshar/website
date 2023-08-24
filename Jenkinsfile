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
        stage(" code review "){
            agent any
            steps{
                 echo 'Successful code review'
            }
        }
        stage(" code unit test "){
            agent any
            steps{
                 echo 'Successful code unit'
            }
        }
        stage(" Build docker image " ){
            steps{
                script{
                    sh  'docker build -f Dockerfile --tag vtong24/devstone:${VERSION} .'
                }
            }    
        }
        stage(" Push image to DockerHub " ){
            steps{
                script{
                    withCredentials([string(credentialsId: 'DOCKER_HUB_P', variable: 'DOCKER_HUB_P')]) {
                        sh  'docker login -u vtong24 -p ${DOCKER_HUB_P}'
                        sh  'docker push vtong24/devstone:${VERSION}'
                        sh  'docker rmi vtong24/devstone:${VERSION}'

                    }
                }
            }
        }
        
    }
}
