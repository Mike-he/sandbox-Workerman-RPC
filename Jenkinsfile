pipeline {
  agent {
    docker {
      image 'node:7-alpine'
    }
    
  }
  stages {
    stage('Test') {
      steps {
        sh 'node --version'
        sh 'echo \'123\''
      }
    }
  }
}