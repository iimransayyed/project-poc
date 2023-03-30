locals {
  bucket_name = "${var.name_prefix}-${terraform.workspace}-bucket"
  bucket_name1 = "${var.name_prefix}-${terraform.workspace}-bucket1"
} 