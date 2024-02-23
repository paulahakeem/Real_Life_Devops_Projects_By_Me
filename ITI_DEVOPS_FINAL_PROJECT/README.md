# Final ITI DevOps-CI-CD-Project Infrastructure

## by Paula Hakeem

## Project Overview:
![22222](https://user-images.githubusercontent.com/116673091/221335102-d0149cba-5f74-457b-83e2-0b5138feabd5.jpg)

- Deploy a Nodejs web application on EKS using CI/CD Jenkins Pipeline using the following steps and high-level diagram:
1. Implement a secure EKS Cluster
2. Deploy and configure Jenkins on EKS
3. Deploy the backend application on EKS using the Jenkins pipeline


## Tools:
| Tool | Purpose |
| ------ | ------ |
| [ Amazon Web Services (AWS) ](https://aws.amazon.com/) | Elastic Kubernetes Service (EKS) is a managed, production-ready environment for running containerized applications. |
| [ Jenkins ](https://www.jenkins.io) | Jenkins – an open-source automation server is enabling developers worldwide to reliably build, test, and deploy their software. |
| [ Ansible ](https://www.ansible.com/) | Ansible helps automate the implementation of internally generated applications to your production programs  |
| [ Docker ](https://www.docker.com) | Docker is a set of platform-as-a-service (PaaS) products that use OS-level virtualization to deliver software in containers|
| [ Terraform ](https://www.terraform.io) | Terraform is an open-source infrastructure as a code software tool that enables you to safely and predictably create, change, and improve infrastructure. |


## First Part: Infrastructure Overview

- ###  Network Files Consist of :
  - Three subnets two private for EKS and another for Bastion Host
  - NAT Gateway 
  - Security group allow 22 , 80 , 443 ports

- ### EKS Files Consist of:
  - private container cluster resource with authorized networks configuration
  - node pool with count 2 
- ### Bastion File: 
    - for Creating a Private VM to Connect with EKS Cluster

## Second Part: Build the Infrastructure
### 1. Clone The Repo:
```
git clone https://github.com/paulahakeem/APP_USED_FOR_ITI_DEVOPS_PROJECT.git/
```
### 2. Navigate to Terraform Code
> After you clone the code navigate to the `Terraform_files` folder to build the infrastructure:
```
cd Terraform_files/
```
#### 3. Initialize Terraform
```
terraform init
```

#### 4. Check Plan
```
terraform plan
```

#### 5. Apply the plan
```
terraform apply
```
## Third Part: Connect to Private EKS Cluster through Bastion VM
> After the Infrastructure is built navigate to `EC2` from the AWS console then `Instances` and click the SSH to `jump_Ec2` to run these commands:
![22121](https://user-images.githubusercontent.com/116673091/221335267-ed596fd4-5ee1-422b-ae7e-85ee4ba37081.png)

### 1. Install Kubectl
```
sudo apt-get install kubectl
```
### 2. Install EKS gcloud auth Plugin
```
sudo apt-get install awscli
```
### 3. Log in with your Credentials
```
aws configure
```
### 4. Connect to EKS Cluster
> to connect to EKS cluster run this command:
```
aws eks --region <region_name> update-kubeconfig --name <cluster_name>
```

### 5. Deploying the jenkins app
> create the deployment.yml file
```
kubectl apply -f deployment.yml
```
### 7. Get `admin` user Password

Connect to Cluster via VM and type
```
kubectl exec <pod_name> -it --n <name_space> -- /bin/cat /var/jenkins_home/secrets initialAdminPassword && echo
```
### 8. Get the `Jenkins URL`
```
kubectl get all -n jenkins
```
and copy the external IP address and paste in browser url
![21212121](https://user-images.githubusercontent.com/116673091/221335628-5871164d-6225-442e-9cb6-62c23e43b666.png)


**Connected Repository**

Jekins CI/CD Repository:

https://github.com/paulahakeem/ITI-Final-CI-CD-Project-Application.git
https://github.com/paulahakeem/APP_USED_FOR_ITI_DEVOPS_PROJECT.git




# SCREENSHOTS FROM CONSOLE 
![111111](https://user-images.githubusercontent.com/116673091/221338968-dc381e6b-d35b-4e5e-a869-72699d8c5f0e.png)
![```111111](https://user-images.githubusercontent.com/116673091/221338962-67a411a7-9a55-4eba-bf44-c6934659373f.png)


