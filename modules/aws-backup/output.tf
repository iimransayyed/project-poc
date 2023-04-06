# Set outputs
output "backup_key" {
  value = (aws_kms_key.backup_key.arn)
}
output "backup_vault" {
  value = (aws_backup_vault.backup_vault.arn)
}
output "aws_backup_plan" {
 value =  (aws_backup_plan.plan.arn)
}