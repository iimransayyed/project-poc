resource "aws_s3_bucket" "example" {
  bucket = "514741091671-my-tf-example-bucket"
  force_destroy = true
  object_lock_enabled = true
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "514741091671-my-tf-log-bucket"
  force_destroy = true
  object_lock_enabled = true
  versioning {
    enabled = true
  }  
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  bucket = aws_s3_bucket.log_bucket.id
  acl    = "log-delivery-write"  
}

resource "aws_s3_bucket_logging" "example" {
  bucket = aws_s3_bucket.example.id
  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/514741091671-my-tf-example-bucket/"
}