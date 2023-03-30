terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

terraform {
  backend "s3" {
    key = "pbb-sit/s3/terraform.tfstate"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}