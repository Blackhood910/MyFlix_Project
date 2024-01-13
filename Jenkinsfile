pipeline {
    agent any

    stages {
        stage('SSH Connection') {
            steps {
                script {
                    sshagent(credentials: ['ec2-id-myflix']) {
                        // Run the uname command on the remote machine
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@23.23.154.48 'echo Hello from ec2'"

                    }
                }
            }
        }

        stage('Checkout') {
            steps {
                // Clone the Git repository
                echo 'Making Git connection'
                echo 'We are inside'
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'git@github.com:Blackhood910/MyFlix_Project.git']]])

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
