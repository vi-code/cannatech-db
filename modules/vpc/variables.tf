variable "region" {
  type        = string
  description = "The AWS region where the VPC will be deployed"
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block to use for the VPC"
}

variable "public_subnets" {
  type        = list(map(string))
  description = "A list of maps containing information about the public subnets."
}

variable "private_subnets" {
  type        = list(map(string))
  description = "A list of maps containing information about the private subnets."
}

variable "environment" {
  type        = string
  description = "The availability zones to use for the subnets"
}