stage('Deployment') {
    when {
        // Schedule to run on the 25th of every month
        expression { currentBuild.getTimeInMillis() < /* specify the timestamp for the 25th of the month */ }
    }
    steps {
        // Add deployment steps here
    }
}
