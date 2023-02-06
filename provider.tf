
provider "aws" {
    region = "us-west-2"
}

terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
    backend "s3" {
        bucket = "viharp-sandbox-us-west-2-tfstate"
        key = "cannatech_db/terraform.tfstate"
        region = "us-west-2"
        encrypt = "true"
        dynamodb_table = "tfstate"
    }
}
