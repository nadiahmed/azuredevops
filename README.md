## Terraform 
Install Terraform (installed in self-hosted agent)
Defined a AKS cluster configuration using Terraform. Create a main.tf file with AKS resource configuration.
Created an Azure DevOps pipeline that automates the Terraform deployment process. Used Azure DevOps YAML pipelines for this.

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

## Usage od Dockerfile

To convert the Java Springboot application to an image that will b used in the deployment.

## Requirements for running the application :
For building and running the application:

- [JDK 1.17](https://adoptium.net/temurin/releases/?os=windows&version=17)

```shell
./gradew build
```
## Running the application locally
```shell
./gradew bootRun
```

## Deploying the application to AKS
Contains the application code and the deployment files for deploying StatefulSet and Application. MySQL db is deployed as a statefulset which has its own volume and pvc. Helm charts are created in Release pipeline of azure devops. 
Deployment is done through Helm Charts (Added as a Json format in <CD-Helm deployment.json>). 