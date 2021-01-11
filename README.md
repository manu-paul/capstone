
# Udaity Devops Capstone Project
This project demonstrates the automated deployment of a simple HTML file application into EKS Kubernetes cluster based on rolling as well as the blue-green deployment strategies. 
The index.html file is running on nginx that shows the message "Hello World, my name is Manu Paul" to the end user.

## Infrastructure
This application requires/utilizes the following infrastructure.
1. Github for source control
2. AWS EC2 instance for Jenkins pipeline setup
3. AWS EC2 instance for Docker build
4. Docker Hub registry to store the docker app image
5. AWS EKS cluster

### Amazon Elastic Kubernetes Service (Amazon EKS) has been created using below command:
<i>eksctl create cluster --name capstone --version 1.17 --nodegroup-name standard-workers --node-type t2.micro --nodes 3 --nodes-min 1 --nodes-max 4 --node-ami auto --region us-west-2</i>

** AWS EC2 instance was provisioned manually for Jenkins and Docker setup<br>
** AWS EKS internally uses CloudFormation and setup the entire infrastructure automatically 

## Deployment - Jenkins Pipeline Build and Deployment Steps - Rolling Update
1. Lint the code
2. Build a Docker image based off of my Dockerfile
3. Upload the container to the Docker Registry
4. Create the Kubernetes configuration file
5. Deploy the application to my AWS EKS cluster

** the file 'eks-deploy.yml' specifies teh deployment strategy as RollingUpdate

## Screen shots 
### Rolling Update (/rolling/screenshots)
1. app.jpg - screenshot of the final web-app.
2. eks_cluster.jpg - AWS-EKS Cluster
3. lint_failed.jpg - Jenkins pipeline Linting stage failed.
4. jenkins_sucess.jpg - Jenkins pipeline sucess
5. docker_hub.jpg - Docker image in registry
6. k8s_get_svc.jpg - K8S service display
7. k8s_describe.jpg - kubectl describe deployments

## App Files
	index.html
## Dockerfiles
	Dockerfile
	run_docker.sh
    upload_docker.sh
## Kubernetes files
	run_k8s.sh
	eks-deployment.yml
## Jenkins 
	Jenkinsfile
