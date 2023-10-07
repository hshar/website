import java.text.SimpleDateFormat

pipeline {
    agent any

    stages {
        stage('Deployment') {
            when {
                // Schedule to run on the 25th of every month
                expression { currentBuild.getTimeInMillis() < getTimestampFor25thOfTheMonth() }
            }
            steps {
                script {
                    // Ensure kubectl is configured properly with credentials
                    def kubectl = sh(script: 'which kubectl', returnStatus: true).trim()
                    if (kubectl != 0) {
                        error("kubectl is not found or not properly configured.")
                    }

                    // Define your deployment steps here
                    sh 'echo "Deploying the application..."'
                    
                    // Replace 'kubectl apply -f deployment.yaml' with your actual deployment command.
                    // Example:
                    sh 'kubectl apply -f /deplayment.yml'
                }
            }
        }
    }
}

def getTimestampFor25thOfTheMonth() {
    def now = new Date()
    // Get the current year and month
    def year = now.format('yyyy')
    def month = now.format('MM')
    // Set the day and time to the 25th of the month at 00:00
    def date = "${year}-${month}-25 00:00:00"
    def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
    return sdf.parse(date).time
}
