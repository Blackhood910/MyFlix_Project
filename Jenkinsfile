pipeline {
    agent any

    environment {
       
        GIT_SSH_CREDENTIALS = credentials('ec2-id-myflix')
        //GIT_REPO_URL = 'git@github.com:yourusername/yourrepository.git'
    }

    stages {
         stage('Checkout') {
            steps {
                // Clone the Git repository
                echo 'making git connection'
                echo 'we are inside'
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'https://github.com/Blackhood910/MyFlix_Project.git']]])
            }
        }

        // Add more stages as needed
    }

    post {
        always {
            // Clean up resources if needed
            cleanWs()
        }
    }
}
