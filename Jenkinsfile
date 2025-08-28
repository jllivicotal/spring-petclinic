#!groovy
pipeline {
  agent none
  options { skipDefaultCheckout(true) }

  stages {
    stage('Checkout') {
      agent any
      steps { checkout scm }
    }

    stage('Build & Test (Maven)') {
      agent {
        docker {
          image 'maven:3.9.6-eclipse-temurin-17'
          args "-v $WORKSPACE/.m2:/root/.m2"
          reuseNode true
        }
      }
      steps {
        sh 'mvn -B clean verify'
      }
      post {
        success {
          archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
          junit 'target/surefire-reports/*.xml'
        }
      }
    }

    stage('Docker Build') {
      agent {
        docker {
          image 'docker:27-cli'
          args '-v /var/run/docker.sock:/var/run/docker.sock'
          reuseNode true
        }
      }
      steps {
        sh 'docker build -t grupo05/spring-petclinic:latest .'
      }
    }
  }
}
