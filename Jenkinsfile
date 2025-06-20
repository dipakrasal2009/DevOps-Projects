pipeline {
    agent any

    environment {
        IMAGE_NAME = "localhost:5000/my-app"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/dipakrasal2009/DevOps-Projects.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push to Local Registry') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }
    }
}

