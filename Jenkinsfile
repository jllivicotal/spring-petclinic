pipeline {
  agent none
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.9.8-eclipse-temurin-17'
          args "-v $WORKSPACE/.m2:/root/.m2"
          reuseNode true
        }
      }
      steps {
        sh 'mvn -v'
        sh 'mvn -B -DskipTests clean package'
      }
    }

    stage('Docker Build') {
      agent {
        docker {
          image 'docker:27-cli'
          args "-v /var/run/docker.sock:/var/run/docker.sock"
          reuseNode true
        }
      }
      steps {
        sh 'docker build -t grupo05/spring-petclinic:latest .'
      }
    }
  }
}
