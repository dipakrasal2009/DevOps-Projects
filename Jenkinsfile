pipeline {
    agent any

    environment {
        IMAGE_NAME = "localhost:5000/my-app1"
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
