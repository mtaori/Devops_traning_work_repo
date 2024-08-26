## Project Overview

This project involves deploying a basic 3-tier web application architecture using Terraform. The architecture includes the following components:

1. **VPC**: Virtual Private Cloud (VPC) with public and private subnets across two availability zones.
2. **Security Groups**: Security groups to manage inbound and outbound traffic for the application and database tiers.
3. **EC2 Instances**: EC2 instances in public subnets for the web servers (Application Tier).
4. **RDS Instance**: RDS MySQL instance in the private subnet for the database (Database Tier).
5. **S3 Bucket**: S3 bucket for storing static files with versioning enabled.
6. **Elastic IPs**: Elastic IPs assigned to the EC2 instances.
7. **IAM Role**: IAM role with necessary permissions attached to the EC2 instances.

## Project Steps

### Step 1: Setup Remote State and Locking

1. Create an S3 bucket for storing Terraform state.
   ![1724666501185](images/Readme/1724666501185.png)
   Create a Dynamodb for state locking:

   ![1724666545629](images/Readme/1724666545629.png)

   Create teh backend in terraform to use s3 bucket and Dynamodb table

   backend.tf

   ```
   terraform {
     backend "s3" {
       bucket         = "s3-bucket-manan-001"
       key            = "terraform/state.tfstate"
       region         = "us-west-2"
       encrypt        = true
       dynamodb_table = "terraform-lock-table"
     }
   }
   ```

### Step 2: Develop and Organize Modules

1. Develop modules for VPC, EC2, RDS, S3, and IAM.
2. Place each module in a separate directory with `main.tf`, `variables.tf`, and `outputs.tf`.
3. here is te directory structure:
   ├── backend.tf
   ├── files
   │   ├── main.tf
   │   ├── outputs.tf
   │   ├── terraform.tfstate
   │   └── variables.tf
   ├── main.tf
   ├── modules
   │   ├── ec2
   │   │   ├── main.tf
   │   │   ├── outputs.tf
   │   │   └── variables.tf
   │   ├── iam
   │   │   ├── main.tf
   │   │   └── variables.tf
   │   ├── rds
   │   │   ├── main.tf
   │   │   ├── outputs.tf
   │   │   └── variables.tf
   │   ├── s3
   │   │   ├── main.tf
   │   │   └── variables.tf
   │   └── vpc
   │       ├── main.tf
   │       ├── outputs.tf
   │       └── variables.tf
   ├── outputs.tf
   ├── Readme.md
   ├── terraform.tfvars
   └── variables.tf

### Step 3: Define Variables and `.tfvars` Files

1. Define variables in `variables.tf` files within each module.
2. Create a `terraform.tfvars` file with default value

![1724667080970](images/Readme/1724667080970.png)

### Step 4: Implement Workspaces

1. Initialize Terraform and create workspaces (development, staging, production).

![1724667156275](images/Readme/1724667156275.png)

![1724667167550](images/Readme/1724667167550.png)

Deploy infrastructure in each workspace using the appropriate `.tfvars` file.

![1724667336178](images/Readme/1724667336178.png)

![1724667345724](images/Readme/1724667345724.png)

### Step 5: Deploy the Infrastructure

1. Use the `terraform apply` command to deploy the infrastructure in each workspace.
   ![1724667463162](images/Readme/1724667463162.png)![1724667471512](images/Readme/1724667471512.png)

Verify the deployment by accessing EC2 instances and ensuring the application is running.

![1724667545764](images/Readme/1724667545764.png)

### Step 6: Implement Lifecycle Rules

1. Modify Terraform code to add lifecycle rules for critical resources.

   ![1724667706534](images/Readme/1724667706534.png)

### Step 7: Cleanup

1. Destroy the infrastructure in each workspace using `terraform destroy`.

   ![1724668056666](images/Readme/1724668056666.png)

   ### Resources

   Instances:

   ![1724668321773](images/Readme/1724668321773.png)

   Similarly vpc, rds is created as well as iam role subnets, internet gateways, route tables, Security groups,  s3 buckets.

   s3 buckets:
   ![1724668497712](images/Readme/1724668497712.png)

   Dynamodb table:
   ![1724668518996](images/Readme/1724668518996.png)
