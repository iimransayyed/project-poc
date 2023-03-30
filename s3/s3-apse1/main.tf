# Create s3 bucket from module
module "s3bucket_1" {
  source = "../../modules/s3/"

  bucket_name        = local.bucket_name

  additional_tags = {
    Environment = "SIT"
    Owner       = "PBB"
    TerraformManaged = "True"
  }
}