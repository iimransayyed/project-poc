# Set variables
variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "ap-southeast-1"
}
variable "name_prefix" {
  type        = string
  description = "resource name prefix"
  default     = "pbb"
}
variable "cluster_name" {
  type        = string
  description = "resource name "
  default     = "pbb-sit-eks-cluster"
}
variable "subnet_id_1" {
  type        = string
  description = "resource name "
  default     = "subnet-0fbff335b148f99d0"
}
variable "subnet_id_2" {
  type        = string
  description = "resource name "
  default     = "subnet-0a78d98679043dcb0"
}
variable "ami_id" {
  type        = string
  description = "resource name "
  default     = "AL2_x86_64"
}
variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.small"
}
variable "capacity" {
  type        = string
  description = "resource name "
  default     = "ON_DEMAND"
}
variable "storage" {
  type        = string
  description = "storage amount "
  default     = "100"
}
variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default = {
    TerraformManaged = "True"
    Environament     = "SIT"
  }
}