pipeline { 
    agent { 
        label 'slave-1'
    }
    
    environment {
        APP_NAME = 'node-app'
        VERSION  =  'slim-1'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                git 'git@github.com:harishvaka/node-test.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the application
                    echo "Building the application"
                    sh 'docker build -t ${APP_NAME}:{VERSION} -f Dockerfile .'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run unit tests
                    echo "Running unit tests"
                    sh 'sleep 10'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Docker deployment using docker compose
                    echo "Deployment is in progress!!!!!!!!!"
                    sh 'docker-compose up'
                }
            }
        }

    }

    post {
        success {
            // Actions to perform after a successful pipeline run
            echo 'Pipeline completed successfully!'
        }
        failure {
            // Actions to perform if the pipeline fails
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
