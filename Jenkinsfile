pipeline {
    agent any
    tools {
        maven "MAVEN"
    }

    stages {
        stage('Build Maven') {
            steps {
               checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/pkanand73/docker-jenkins-k8s-integration.git']])
               bat 'mvn clean install'
              }
        }
        stage('Build Docker') {
            steps {
               bat 'docker build -t pranavkumar589/docker-jenkins-k8s-integration:01 .'
              }
        }
        stage('Push image to dockerhub') {
            steps {
                withCredentials([string(credentialsId: 'DOCKER_PASS', variable: 'DOCKER_PASS')]) {
                    bat 'docker login -u pranavkumar589@gmail.com -p int@imss123'
                }
               bat 'docker push pranavkumar589/docker-jenkins-k8s-integration:01'
              }
        }
        
        stage('Deploy') {
            steps {
                kubernetesDeploy (configs: 'deployment.yml', kubeconfigId: 'kubeconfig')
                bat 'kubectl rollout restart deployment docker-jenkins-k8s-deployment'
              }
        }
        
    }
}
