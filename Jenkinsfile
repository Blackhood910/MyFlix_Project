pipeline {
    agent any


    stages {
        steps {
    sshagent (credentials: ['deploy-dev']) {
    sh 'ssh -o StrictHostKeyChecking=no -l ubuntu@ 23.23.154.48 uname -a'
  }

}
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
