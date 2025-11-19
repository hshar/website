pipeline {
    agent {label "ubuntu"}
    
    stages {
        stage("Clone Code"){
            steps {
                echo "Cloning repository"
                git url: "https://github.com/AsleshaBorkar/website.git", branch:"patch-1"
                echo "code cloning is successful"
            }
        }
        stage("Build Docker Image"){
            steps {
                echo "Building Docker image"
                sh "docker build -t website:latest ."
            }
        }
       
        stage("Deploy Container"){
            steps {
              echo "Deploying container"
                sh "docker compose down && docker compose up -d --build"
                 echo "Deployment is done!"
            }
        }
    }
}

