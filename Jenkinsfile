pipeline {
    agent any

    environment {
        GIT_CREDS = "git-repo-access"
    }

    stages {
        stage('Delete Workspace') {
            steps {
                script {
                    sshagent(credentials: ['ec2-id-myflix2']) {// Delete the existing workspace
                   
                    sh """ssh -o StrictHostKeyChecking=no ubuntu@44.211.14.222 '
                        docker stop /$(docker ps -a -q) &&
                        rm -r MyFlix_Project' """


                    }

                }
            }
        }

        stage('SSH Connection') {
            steps {
                script {
                    withCredentials([string(credentialsId: "${GIT_CREDS}", variable: 'GIT_TOKEN')]) {
                        sshagent(credentials: ['ec2-id-myflix2']) {
                            // Run the uname command on the remote machine
                      sh """ssh -o StrictHostKeyChecking=no ubuntu@44.211.14.222 '
                            git clone https://${GIT_TOKEN}@github.com/Blackhood910/MyFlix_Project.git'"""

                        }
                    }
                }
            }
        }
            stage('Myflix Deployment') {
    steps {
        script {
            sshagent(credentials: ['ec2-id-myflix2']) {
                // Run the uname command on the remote machine
                sh """ssh -o StrictHostKeyChecking=no ubuntu@44.211.14.222 '
                    echo "deploying my flix project"
                    cd MyFlix_Project/ &&
                    docker build -t myflix . &&
                    docker run -d -p 8000:8000 myflix'"""
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
