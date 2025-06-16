pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/dipakrasal2009/DevOps-Projects.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the project...'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
            }
        }
    }
}

