# Create VPC from module
# Change environment name, CIDR blocks and additional tags as needed
module "vpc_staging" {
  source = "../../modules/vpc/"

  environment_name         = local.vpc_name
  vpc_cidr                 = "10.2.0.0/16"
  public_subnet_cidr_az_a  = ["10.2.0.0/22"]
  private_subnet_cidr_az_a = ["10.2.12.0/22"]

  additional_tags = {
    Environment = "SIT"
    Owner       = "PBB"
    TerraformManaged = "True"
  }
}