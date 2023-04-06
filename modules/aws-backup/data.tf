locals {
  backups = {
    schedule  = "cron(0 20 * * ? *)" /* UTC Time */
    cold_storage_after = 14
    retention = 365 // days
  }
  env    = "sit"
  client = "pbb"
}


##IAM Policy for AWSBackupServiceRolePolicyForBackup
data "aws_iam_policy_document" "backup" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["backup.amazonaws.com"]
    }
  }
version = "2012-10-17"
}
data "aws_iam_policy" "backup" {
  name = "AWSBackupServiceRolePolicyForBackup"
}
