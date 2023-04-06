### AWS Backup CMK 
resource "aws_kms_key" "backup_key" {
  description             = "Backup KMS key"
  deletion_window_in_days = 10
  tags                    = var.tags
}

### AWS Backup Vault
resource "aws_backup_vault" "backup_vault" {
  name        = var.backup_vault_name
  kms_key_arn = aws_kms_key.backup_key.arn
  tags        = var.tags
}

### AWS IAM Policy for Backup
resource "aws_iam_role" "backup" {
#   name               = "backup_iam_role"
  name               = var.backup_role
  assume_role_policy = data.aws_iam_policy_document.backup.json
  tags               = var.tags
}

### AWS IAM Policy for Backup attachment
resource "aws_iam_role_policy_attachment" "backup" {
  policy_arn = data.aws_iam_policy.backup.arn
  role       = aws_iam_role.backup.name
}

### AWS backup selection of resources based on tag
resource "aws_backup_selection" "ec2volumes" {
  iam_role_arn = aws_iam_role.backup.arn
  name         = var.aws_backup_selection
  plan_id      = aws_backup_plan.plan.id
  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Backup"
    value = "Yes"
  }
}

### AWS Backup Plan
resource "aws_backup_plan" "plan" {
  name = var.aws_backup_plan_name
rule {
    rule_name         = var.rule_name
    target_vault_name = aws_backup_vault.backup_vault.name
    schedule          = local.backups.schedule
    start_window      = var.start_window
    completion_window = var.completion_window
lifecycle {
      cold_storage_after = local.backups.cold_storage_after
      delete_after       = local.backups.retention
    }
  }
}
