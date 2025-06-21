pipeline {
    agent any

    environment {
        IMAGE_NAME = "dipak-app"
        TAG = "latest"
        REGISTRY = "localhost:5000" // Update if using custom IP:PORT
    }

    stages {

        stage('Clone Repo') {
            steps {
                git branch: 'master', url: 'https://github.com/dipakrasal2009/DevOps-Projects.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${TAG} ."
                }
            }
        }

        stage('Tag Image for Registry') {
            steps {
                script {
                    sh "docker tag ${IMAGE_NAME}:${TAG} ${REGISTRY}/${IMAGE_NAME}:${TAG}"
                }
            }
        }

        stage('Push to Local Registry') {
            steps {
                script {
                    sh "docker push ${REGISTRY}/${IMAGE_NAME}:${TAG}"
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build and push successful!'
        }
        failure {
            echo '❌ Build or push failed.'
        }
    }
}

