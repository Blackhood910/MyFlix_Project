pipeline {
    agent any

    environment {
        GIT_CREDS = "git-repo-access"
    }

    stages {
        stage('Delete Workspace') {
            steps {
                script {
                    // Delete the existing workspace
                    deleteDir()
                    }
                }
            }

        stage('SSH Connection') {
            steps {
                script {
                    withCredentials([string(credentialsId: "${GIT_CREDS}", variable: 'GIT_TOKEN')]) {
                        sshagent(credentials: ['ec2-id-myflix']) {
                            // Run the uname command on the remote machine
                      sh """ssh -o StrictHostKeyChecking=no ubuntu@23.23.154.48 '
                            cd /myflix &&
                            git clone https://${GIT_TOKEN}@github.com/Blackhood910/MyFlix_Project.git'"""

                        }
                    }
                }
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
