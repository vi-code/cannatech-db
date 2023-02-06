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
  cidr_block              = var.public_subnets[count.index].cidr_block
  map_public_ip_on_launch = true
  availability_zone       = var.public_subnets[count.index].availability_zone
  tags = {
    Service     = "vpc"
    Terraform   = "true"
    Environment = var.environment
  }
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnets[count.index].cidr_block
  availability_zone = var.private_subnets[count.index].availability_zone
  tags = {
    Service     = "vpc"
    Terraform   = "true"
    Environment = var.environment
  }
}