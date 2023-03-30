# Set variables
variable "environment_name" {
  type        = string
  description = "Set environment name"
  default     = ""
}
variable "name_prefix" {
  type    = string
  default = ""
}
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = ""
}

variable "availability_zone" {
  type        = list(string)
  description = "Availability Zone"
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}
variable "additional_tags" {
  type        = map(string)
  description = "Variable if additional tags is needed"
  default     = {}
}
variable "public_subnet_interfix" {
  type        = string
  description = "Give interfix to public subnet name"
  default     = "public"
}
variable "public_subnet_cidr_az_a" {
  type        = list(string)
  description = "Public subnet CIDR within AZ-a"
  default     = []
}
