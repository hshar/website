pipeline {
    agent any

    stages {
        stage('Deployment') {
            when {
                // Schedule to run on the 25th of every month
                expression { currentBuild.getTimeInMillis() < getTimestampFor25thOfTheMonth() }
            }
            steps {
                // Add your deployment steps here
                // For example:
                sh 'echo "Deploying the application"'
                sh 'kubectl apply -f deployment.yaml'
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
