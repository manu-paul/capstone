pipeline {
     agent any
     stages {
           stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
        
         stage('Build Docker Image') {
              steps {
                  sh 'docker build -t capstone .'
              }
         }
         stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
                      sh "docker tag capstone pmanu1977/capstone"
                      sh "docker push pmanu1977/capstone"
                  }
              }
         }
         stage('Deploying') {
              steps{
                  echo 'Deploying to AWS...'
                  withAWS(credentials: 'capstone-aws-id', region: 'us-west-2') {
                      sh "aws eks --region us-west-2 update-kubeconfig --name capstone"
                      sh "kubectl config use-context arn:aws:iam::944378258408:user/jenkins"
                      sh "kubectl apply -f capstone-deploy.yml"
                      sh "kubectl get nodes"
                      sh "kubectl get deployment"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/capstone"
                  }
              }
        }
        stage("Cleaning up") {
              steps{
                    echo 'Cleaning up...'
                    sh "docker system prune"
              }
        }
     }
}
