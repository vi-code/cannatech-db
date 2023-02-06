resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block

  tags = {
    Service     = "vpc"
    Terraform   = "true"
    Environment = var.environment
  }
}

resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = true

  tags = {
    Service     = "vpc"
    Terraform   = "true"
    Environment = var.environment
  }
}

resource "aws_subnet" "private_subnet" {
  count      = length(var.private_subnets)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnets[count.index]

  tags = {
    Service     = "vpc"
    Terraform   = "true"
    Environment = var.environment
  }
}