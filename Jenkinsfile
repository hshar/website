pipeline {
    agent any
    
    environment {
        IMAGE_NAME = 'website-app'
        PROD_CONTAINER_NAME = 'website-prod'
        PROD_PORT = '82'
    }
      stages {
        stage('Checkout') {
            steps {
                echo "Checking out branch: ${env.BRANCH_NAME}"
                checkout scm
            }
        }

        stage('Validate') {
            steps {
                script {
                    echo "Validating repository structure..."
                    sh '''
                        if [ ! -f "index.html" ]; then
                            echo "Error: index.html not found!"
                            exit 1
                        fi
                        echo "Validation passed: index.html exists"
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image for branch: ${env.BRANCH_NAME}"
                    def imageTag = "${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
                    env.IMAGE_TAG = imageTag
                    sh """
                        docker build -t ${env.IMAGE_NAME}:${env.IMAGE_TAG} .
                        docker tag ${env.IMAGE_NAME}:${env.IMAGE_TAG} ${env.IMAGE_NAME}:${env.BRANCH_NAME}-latest
                        echo "DOCKER IMAGE BUILT SUCCESSFULLY: ${env.IMAGE_NAME}:${env.IMAGE_TAG}"
                    """
                }
            }
        }

        stage('Test Build') {
            steps {
                script {
                    echo "Testing Docker image build..."

                    def testContainer = "test-container"
                    def networkName = "jenkins-test-network"
                    
                    sh """
                        # Create network if it doesn't exist
                        docker network create ${networkName} 2>/dev/null || true
                        
                        # stop and remove any leftover test container
                        docker rm -f ${testContainer} 2>/dev/null || true

                        # Run new test container on port 8081
                        docker run -d --name ${testContainer} --network ${networkName} -p 8081:80 ${env.IMAGE_NAME}:${env.IMAGE_TAG}
                        sleep 20
                        
                        response=\$(docker run --rm --network ${networkName} curlimages/curl -s -o /dev/null -w "%{http_code}" http://${testContainer}:80 || echo "000")
                        if [ "\$response" != "200" ]; then
                            echo "Build test failed"
                            exit 1
                        else
                            echo "Build test passed"
                        fi
                        echo "Build test completed successfully"
                    """
                }
            }
        }

        stage('Deploy to Production') {
            when {
                branch 'master'
            }
            steps {
                script {
                    sh """
                        docker stop ${env.PROD_CONTAINER_NAME} 2>/dev/null || true
                        docker rm ${env.PROD_CONTAINER_NAME} 2>/dev/null || true
                        docker run -d --name ${env.PROD_CONTAINER_NAME} -p ${env.PROD_PORT}:80 --restart unless-stopped ${env.IMAGE_NAME}:${env.IMAGE_TAG}
                    """
                    echo "Production deployed successfully on port ${env.PROD_PORT}"
                }
            }
        }
    }

    post {
        always {
            sh '''
            docker ps -aq --filter "name=test-container" | xargs -r docker rm -f || true
            docker image prune -f || true
            echo "Skipping cleanup for debugging"
            '''
        }
    }
}
