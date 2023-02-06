module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  public_subnets = [
    {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-west-2a"
    },
    {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "us-west-2c"
    },
    {
      cidr_block        = "10.0.3.0/24"
      availability_zone = "us-west-2b"
    }
  ]
  private_subnets = [
    {
      cidr_block        = "10.0.11.0/24"
      availability_zone = "us-west-2a"
    },
    {
      cidr_block        = "10.0.12.0/24"
      availability_zone = "us-west-2c"
    },
    {
      cidr_block        = "10.0.13.0/24"
      availability_zone = "us-west-2b"
    }
  ]
  region      = "us-west-2"
  environment = "dev"
}

module "secrets" {
  source = "./modules/secrets"
  name   = "cannatech-db"
}

module "rds" {
  source     = "./modules/rds"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = ["subnet-005df394e3bff52d9", "subnet-059900938e682741e", "subnet-0b8b06e8611f1561f"]
}