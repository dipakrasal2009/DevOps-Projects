pipeline {
    agent any

    environment {
        IMAGE_NAME = "abcd"
        DOCKER_HUB_USER = "dipakrasal2009"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/dipakrasal2009/DevOps-Projects.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_HUB_USER/$IMAGE_NAME:$IMAGE_TAG ."
                }
            }
        }

        stage('Docker Hub Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                    }
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                script {
                    sh "docker push $DOCKER_HUB_USER/$IMAGE_NAME:$IMAGE_TAG"
                }
            }
        }

        stage('Run Ansible') {
            steps {
                script {
                    sh 'ansible-playbook -i ansible/hosts ansible/deploy.yml'
                }
            }
        }
    }
}

