locals {
  env    = "sit"
  client = "pbb"
}
module "backup_staging" {
  source = "../modules/aws-backup/"

  backup_vault_name = "${local.client}-${local.env}-backup-vault" 
  backup_role = "${local.client}-${local.env}-backup-role" 
  aws_backup_selection  = "${local.client}-${local.env}-backup-selection" 
  aws_backup_plan_name = "${local.client}-${local.env}-backup-plan"
  rule_name =  "${local.client}-${local.env}-backup-rule"
  start_window = "60"
  completion_window = "120"
  tags = {
    Environment = "SIT"
    Owner       = "PBB"
    TerraformManaged = "True"
  }
}