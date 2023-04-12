# Set variables
variable "bucket_name" {
  type        = string
  description = "Set environment name"
  default     = ""
}
variable "acl_value" {
  type        = string
  description = "acl value"
  default     = "private"
}
variable "acl_value1" {
  type        = string
  description = "acl value"
  default     = "log-delivery-write"
}
variable "additional_tags" {
  type        = map(string)
  description = "Variable if additional tags is needed"
  default     = {}
}
# Set variables
variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = ""
}
variable "name_prefix" {
  type    = string
  default = ""
}