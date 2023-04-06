# Set variables
variable "backup_vault_name" {
  type = string
}
variable "aws_backup_selection" {
  type = string
}
variable "aws_backup_plan_name" {
  type = string
}
variable "backup_role" {
  type = string
}
variable "rule_name" {
  type = string
}
variable "start_window" {
  type = string
}
variable "completion_window" {
  type = string
}
variable "tags" {
  type = map(any)
}
