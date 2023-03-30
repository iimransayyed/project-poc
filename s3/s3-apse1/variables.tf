# Set variables
variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "ap-southeast-1"
}
variable "name_prefix" {
  type    = string
  description = "bucket name prefix"  
  default = "514741091671-pbb"
}
