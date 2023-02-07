## RDS Module for Cannatech

This Terraform module is used to set up an RDS database instance and its associated security group in Amazon Web Services (AWS).

The following resources are created in this module:

-   AWS Secrets Manager secret to store the database password securely
-   AWS RDS database subnet group to manage subnets used by the database
-   AWS RDS database instance
-   AWS security group to control inbound access to the database instance

### Input Variables

-   `engine`: The database engine to be used for the instance (e.g. "postgres").
-   `instance`: The instance type for the RDS instance (e.g. "db.t2.micro").
-   `identifier`: A unique identifier for the RDS instance.
-   `name`: The name of the RDS instance.
-   `ingress_port`: The port to be opened for ingress traffic on the security group.
-   `subnet_ids`: A list of subnet IDs to be used for the RDS instance.
-   `vpc_id`: The ID of the VPC where the RDS instance will be deployed.

### Outputs

-   `instance_endpoint`: The endpoint of the RDS instance.
-   `instance_port`: The port used by the RDS instance.

### Usage

To use this module, define the input variables in your Terraform code and add the following module block:

      module "rds" {
	      source = "./modules/rds"
	      engine = var.engine
	      instance = var.instance
	      identifier = var.identifier
	      name = var.name
	      ingress_port = var.ingress_port
	      subnet_ids = var.sub

## Limitations

-   This module assumes that an AWS Secrets Manager secret has been created to store the database password.
-   This module creates an RDS instance and security group with a single ingress rule for incoming connections on the specified port. Additional security requirements (e.g. multiple ingress rules, network isolation) can be added as needed.