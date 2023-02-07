
## IAM Module for Lambda execution at Cannatech

This Terraform module creates an IAM policy and role for a Lambda function to access an Amazon RDS database. The policy grants the necessary permissions to the Lambda function, allowing it to perform read and write operations on the database. The role defines the trust relationship between the Lambda function and AWS, ensuring that the function has the necessary permissions to interact with other AWS services.

## Variables

The following variables are required to use this module:

-   `rds_instance_arn`: The Amazon Resource Name (ARN) of the RDS instance that the Lambda function should access.

## Resources

The following Terraform resources are created by this module:

-   `aws_iam_policy`: A policy that defines the permissions granted to the Lambda function.
    
-   `aws_iam_role_policy_attachment`: An attachment that associates the policy with the IAM role.
    
-   `aws_iam_role`: An IAM role that defines the trust relationship between the Lambda function and AWS.
    

## Outputs

This module exports the following outputs:

-   `lambda_role_arn`: The Amazon Resource Name (ARN) of the IAM role created for the Lambda function.

## Usage

To use this module in your Terraform configuration, include the following code in your root module:

`module "lambda_rds_access" {
  source = "path/to/module"
  rds_instance_arn = aws_db_instance.rds.arn
}` 

This code assumes that you have already created an RDS instance and that its ARN is stored in the `aws_db_instance.rds.arn` Terraform output. Replace `path/to/module` with the path to the module in your file system.

In your Lambda function configuration, specify the IAM role created by this module by including the following code:

`role = module.lambda_rds_access.lambda_role_arn` 
