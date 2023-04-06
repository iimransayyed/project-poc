# Set outputs
output "backup_key" {
  value = (aws_kms_key.backup_key.arn)
}
output "backup_vault" {
  value = (aws_backup_vault.backup_vault.arn)
}
output "backup_vault_id" {
  value = (aws_backup_vault.backup_vault.id)
}
output "aws_backup_plan_arn" {
 value =  (aws_backup_plan.plan.arn)
}
output "aws_backup_plan_id" {
 value =  (aws_backup_plan.plan.id)
}
