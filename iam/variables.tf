# Set variables
variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "ap-southeast-1"
}
variable "name_prefix" {
  type    = string
  default = "pbb"
}
variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {
    TerraformManaged = "True"
    Environament = "SIT"
  }
}