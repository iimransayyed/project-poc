locals {
  iam_policy_name = "${var.name_prefix}-${terraform.workspace}-iam_policy1"
  iam_role_name = "${var.name_prefix}-${terraform.workspace}-iam_role1"
  aws_region= "ap-southeast-1"
  account_id = "514741091671"
} 
data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
data "aws_iam_policy_document" "example" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::skundu-proj3-3p-installers/download/*",
    ]
  }
} 