pipeline {
    agent any

    environment {
        GIT_CREDS = "git-repo-access"
    }

    stages {
        stage('Delete Workspace') {
            steps {
                script {
                    sshagent(credentials: ['ec2-id-myflix']) {// Delete the existing workspace
                   
                    sh """ssh -o StrictHostKeyChecking=no ubuntu@23.23.154.48 '
                        rm -r MyFlix_Project' """


                    }

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
                            git clone https://${GIT_TOKEN}@github.com/Blackhood910/MyFlix_Project.git'"""

                        }
                    }
                }
            }
        }
            stage('Myflix Deployment') {
            steps {
                script {
                        sshagent(credentials: ['ec2-id-myflix']) {
                            // Run the uname command on the remote machine
                      sh """ssh -o StrictHostKeyChecking=no ubuntu@23.23.154.48 '
                            echo 'deploying my flix project
                            cd MyFlix_Project/ &&
                            docker build -t Myflix
                            docker run -d -p 8000:8000 Myflix '"""

                        }
                    }
                }
            }
        // Add more stages as needed
    }


        
        // Add more stages as neede
    post {
        always {
            // Clean up resources if needed
            cleanWs()
        }
    }
}
