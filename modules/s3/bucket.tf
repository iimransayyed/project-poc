resource "aws_s3_bucket" "demos3" {
    bucket = "${var.bucket_name}" 
    acl = "${var.acl_value}"   
    tags = merge(
        { "Name" = var.bucket_name },
        var.additional_tags
    )    
}

resource "aws_s3_bucket" "demos4" {
    bucket = "${var.bucket_name}" 
    acl = "${var.acl_value1}"   
    tags = merge(
        { "Name" = var.bucket_name },
        var.additional_tags
    )    
}

resource "aws_s3_bucket_logging" "demos3" {
  bucket = aws_s3_bucket.demos3.id
  target_bucket = aws_s3_bucket.demos4.id
  target_prefix = "log/"
}