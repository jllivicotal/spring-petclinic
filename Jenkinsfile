pipeline {
    agent any
    tools {
        maven 'Maven3'
    }
    stages {
        stage('Maven Install') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t grupo05/spring-petclinic:latest .'
            }
        }
    }
}
