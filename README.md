# AWS RDS Database with Terraform and S3 backend

This project creates an RDS database in AWS using Terraform and an S3 backend with DynamoDB state lock. The project uses a combination of terraform modules to create the RDS database and its supporting infrastructure, including the VPC, subnets, and security groups.

## Requirements

The following components are required to complete this project:

-   AWS account
-   Terraform version 0.13 or higher
-   Terraform AWS Provider version 3.0 or higher
-   S3 bucket for storing Terraform state
-   DynamoDB table for state lock

## Preparation

Before getting started, make sure you have an AWS account and the necessary Terraform components installed on your machine. Create an S3 bucket for storing Terraform state and a DynamoDB table for state lock.

Terraform can use `AWS_ACCESS_KEY_ID` and its corresponding secret key to have the permissions to deploy stuff in the AWS account.

## Components

The following modules will be used in this project:

-   VPC Module: creates an AWS VPC, public subnets, and private subnets.
-   RDS Password Secrets Manager: generates and stores a password for the RDS database.
-   RDS Database Module: creates the RDS database.

## Configuration

To begin, set the following variables in your Terraform configuration:

-   AWS access key and secret key
-   S3 bucket name and region for storing Terraform state
-   DynamoDB table name for state lock
-   VPC CIDR block, public subnets, and private subnets
-   RDS database engine, instance type, identifier, and name
-   RDS database ingress port

## Deployment

Initialize the Terraform modules:

`terraform init`

Then run the Terraform plan command to preview the changes:

`terraform plan`

Finally, run the Terraform apply command to deploy the RDS database:

`terraform apply`

## Teardown

To tear down the RDS database and its supporting infrastructure, run the Terraform destroy command:

`terraform destroy`

## Improvements

- Using `tfvars` or Terragrunt to deploy to multiple environments.
- Input validation and various checks when spinning up resources or alternatively use modules from Terraform registry since they are more fool proof.
- Use IAM roles for terraform to assume rather than providing it with Admin access key
- Create a lambda module that allows users to write lambda functions that can perform reads and writes on the database