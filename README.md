Terraform :
Install Terraform (installed in self-hosted agent)
Defined a AKS cluster configuration using Terraform. Create a main.tf file with AKS resource configuration.
Created an Azure DevOps pipeline that automates the Terraform deployment process. Used Azure DevOps YAML pipelines for this.

terraform init -> Initialize Terraform
terraform plan -> To analyse the resources that Terraform will create
terraform apply -> Apply the changes to create the infra.

Dockerfile : 
To convert the Java Springboot application to an image that will b used in the deployment


App:
Contains the application code and the deployment files for deploying StatefulSet and Application. MySQL db is deployed as a statefulset which has its own volume and pvc. 


Deployment: 
Deployment is done through Helm Charts. Releases are created in Azure DevOps with a stage for Adding Helm task group.