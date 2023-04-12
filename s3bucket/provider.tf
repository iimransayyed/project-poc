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
    key = "pbb/s3bucket/terraform.tfstate"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
}