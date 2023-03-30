# Configuration section for vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = merge(
    { "Name" = var.environment_name },
    var.additional_tags
  )
}
# Configuration section for internet gateway
# resource "aws_internet_gateway" "internet_gateway" {
#   vpc_id = aws_vpc.vpc.id

#   tags = merge(
#     { "Name" = var.environment_name },
#     var.additional_tags
#   )
# }