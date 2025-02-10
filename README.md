# Terraform Infrastructure Deployment with Jenkins Pipeline

## Overview
This repository contains a Jenkins pipeline script to automate the deployment of infrastructure using Terraform on AWS. The pipeline includes the following stages:

1. **CodeClone** - Clones the Terraform configuration from a GitHub repository.
2. **AWSLogin** - Authenticates with AWS using stored credentials.
3. **InstallInfra** - Initializes Terraform, creates an execution plan, and applies it to deploy the infrastructure.
4. **Destroy** - Cleans up the deployed infrastructure when required.

---

## Prerequisites
Before running the pipeline, ensure you have:

- A Jenkins server with the following plugins installed:
  - Pipeline
  - Git
  - AWS Credentials Plugin
- An AWS account with IAM credentials stored in Jenkins (`aws-cred`).
- Terraform installed on the Jenkins agent.

---

## Jenkins Pipeline Script

[Infrastructure Folder](/JenkinsFile)
## Explanation of Pipeline Stages

### 1. **CodeClone**
- Clones the repository containing Terraform scripts.

### 2. **AWSLogin**
- Retrieves AWS credentials from Jenkins and logs into AWS.
- Runs `aws sts get-caller-identity` to verify authentication.

### 3. **InstallInfra**
- Initializes Terraform.
- Creates an execution plan.
- Applies the plan to deploy infrastructure.

### 4. **Destroy**
- Ensures the `terraform destroy` step runs **only if the previous steps were successful**.
- Destroys the deployed infrastructure.

---

## How to Use

1. Clone this repository:
   ```sh
   git clone https://github.com/AmittAshok/Jenkins-terraform-automate.git
   ```
2. Configure AWS credentials in Jenkins (`aws-cred`).
3. Set up Terraform in Jenkins under **Global Tool Configuration**.
4. Create a new **Jenkins Pipeline** and paste the script into the pipeline configuration.
5. Run the Jenkins job to deploy infrastructure.

---

## Troubleshooting

### **Error: No valid credential sources found**
- Ensure AWS credentials are correctly stored in Jenkins.
- Verify that IAM permissions allow Terraform to manage AWS resources.
- Run `aws sts get-caller-identity` manually to test authentication.

### **Error: Too many command line arguments for Terraform Apply**
- Change `terraform apply tfplan -auto-approve` to `terraform apply -auto-approve`.

---

## Contributing
Feel free to fork this repository and submit a pull request with improvements!

---

## License
This project is licensed under the MIT License.

