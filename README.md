## Terraform 
- Install Terraform (installed in self-hosted agent)
- Define a AKS cluster configuration using Terraform. Create a main.tf file with AKS resource configuration.
- Create an Azure DevOps pipeline that automates the Terraform deployment process. Used Azure DevOps YAML pipelines for this.

## Install Terraform (For Windows - Using a self-hosted agent and the system available is Windows)
```bash
$ choco install terraform
```
NOTE: you must install `HOMEBREW` to the host :
```bash
$ @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

## Init 
---------
```bash
$ terrafrom init
```
This command will Initialize Terraform to provision a resource.

## Plan
---------
```bash
$ terrafrom plan
```
This command with prompt the resource that will be added, it is similar to a dry-run.
## Apply
---------
```bash
$ terrafrom apply
```
Apply the changes to create the infra.
Also,  `-auto-approve` command has been provided to automatically approve the plan and apply command

## Usage of Dockerfile

To convert the Java Springboot application to an image that will b used in the deployment.

## Deploying the application to AKS
Contains the application code and the deployment files for deploying StatefulSet and Application. MySQL db is deployed as a statefulset which has its own volume and pvc. Helm charts are created in Release pipeline of azure devops. 
Deployment is done through Helm Charts (Added as a Json format in `CD-Helm deployment.json`).

## Trigger
A Trigger is added in Azure pipeline and release pipeline to deploy the pipeline automatically when a merge occurs in the main branch. 

## Requirements for running the application :
For building and running the application:

- [JDK 1.17](https://adoptium.net/temurin/releases/?os=windows&version=17)

```shell
./gradlew build
```
### Running the application locally
These steps are not required when deploying in the cluster

#### Connecting local application to deployed database

The local connections will have to be port forwaded to the deployed cluster on which the database runs to access the data
- Login to Azure and connect to cluster
- Get the deployed pod
- Install [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/)
- Enable port forwarding for MySQL database (port 3306) to the pod (mysql-0)
```cmd
kubectl port-forward mysql-0 3306:3306
```
#### Running the service
- Navigate to project folder and run the following
```shell
./gradlew bootRun
```
- The embedded Tomcat web server will be running on `localhost:8080`
- Accessing this endpoint will hit the service and print `'Hello World! from database!'` from the MySQL database.