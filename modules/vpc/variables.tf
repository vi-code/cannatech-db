variable "region" {
  type        = string
  description = "The AWS region where the VPC will be deployed"
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block to use for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "The CIDR blocks to use for the public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "The CIDR blocks to use for the private subnets"
}

variable "environment" {
  type        = string
  description = "The availability zones to use for the subnets"
}