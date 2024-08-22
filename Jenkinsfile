pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "react:v1"
        CONTAINER_NAME = "react-login"
        DOCKERHUB_CREDENTIALS = 'da22d71d-3ce2-4e73-9e6a-79ea4657cff5'
        GIT_REPO_URL = 'https://github.com/MathanbabuMoorthi/mahesh.git'
        APP_PORT = '3000'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'jenkins', url: "${env.GIT_REPO_URL}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${env.DOCKER_IMAGE} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh """
                    docker stop ${env.CONTAINER_NAME} || true
                    docker rm ${env.CONTAINER_NAME} || true
                    docker run -d --name ${env.CONTAINER_NAME} -p ${env.APP_PORT}:${env.APP_PORT} ${env.DOCKER_IMAGE}
                    """
                }
            }
        }

        stage('Display URL') {
            steps {
                script {
                    def url = "http://localhost:${env.APP_PORT}"
                    echo "Application is running at ${url}"
                }
            }
        }
    }
}
