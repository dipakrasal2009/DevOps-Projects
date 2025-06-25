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
                    sh '''
                        export LC_ALL=en_US.UTF-8
                        export LANG=en_US.UTF-8
                        ansible-playbook -i ansible/hosts ansible/deploy.yml
                    '''
                }
            }
        }
    }
}

