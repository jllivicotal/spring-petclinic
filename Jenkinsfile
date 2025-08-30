pipeline {
  agent none
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.9.8-eclipse-temurin-17'
          args  '-v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock'
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
          image 'docker:27.2-cli'
          args  '-v /var/run/docker.sock:/var/run/docker.sock -v $PWD:/work -w /work'
        }
      }
      steps {
        sh 'docker build -t grupo05/spring-petclinic:latest .'
      }
    }
  }
}
