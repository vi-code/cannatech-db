# VPC Terraform Module for Cannatech

## Overview

This Terraform module creates an AWS VPC, with public and private subnets. The module is designed to provide a scalable and flexible solution for setting up a virtual private cloud on AWS.

## Variables

The following variables must be set when using this module:

-   `cidr_block`: The IP range for the VPC in CIDR notation.
-   `public_subnets`: A list of maps, each map containing the following keys:
    -   `cidr_block`: The IP range for the subnet in CIDR notation.
    -   `availability_zone`: The availability zone to launch the subnet in.
-   `private_subnets`: A list of maps, each map containing the following keys:
    -   `cidr_block`: The IP range for the subnet in CIDR notation.
    -   `availability_zone`: The availability zone to launch the subnet in.
-   `environment`: The environment the VPC is being created for, such as "dev" or "prod".

## Resources

The following resources are created by this module:

-   An AWS VPC with the specified `cidr_block`.
-   Public subnets in the specified availability zones with the specified `cidr_block` and with `map_public_ip_on_launch` set to `true`.
-   Private subnets in the specified availability zones with the specified `cidr_block`.

## Outputs

This module outputs the following values:

-   `vpc_id`: The ID of the created VPC.

## Usage

Here's an example of how to use this module:
    module "vpc" {
        source = "./modules/vpc"

        cidr_block = "10.0.0.0/16"

        public_subnets = [
            {
            cidr_block      = "10.0.0.0/24"
            availability_zone = "us-west-2a"
            },
            {
            cidr_block      = "10.0.1.0/24"
            availability_zone = "us-west-2b"
            }
        ]

        private_subnets = [
            {
            cidr_block      = "10.0.100.0/24"
            availability_zone = "us-west-2a"
            },
            {
            cidr_block      = "10.0.101.0/24"
            availability_zone = "us-west-2b"
            }
        ]

        environment = "dev"
        }