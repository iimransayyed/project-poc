# Configuration section for vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = merge(
    { "Name" = var.environment_name },
    var.additional_tags
  )
}