# Create s3 bucket from module
module "s3bucket_1" {
  source = "../../modules/s3/"

  bucket_name        = local.bucket_name1

  additional_tags = {
    Environment = "SIT"
    Owner       = "PBB"
    TerraformManaged = "True"
  }
}

module "s3bucket_2" {
  source = "../../modules/s3/"
  bucket_name        = local.bucket_name2
  additional_tags = {
    Environment = "SIT"
    Owner       = "PBB"
    TerraformManaged = "True"
  }
}