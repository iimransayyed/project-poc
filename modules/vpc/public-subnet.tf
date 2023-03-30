# Configuration section for Public Subnet
resource "aws_subnet" "public_subnet_az_a" {
  count = length(var.public_subnet_cidr_az_a)

  cidr_block        = element(var.public_subnet_cidr_az_a, count.index)
  vpc_id            = aws_vpc.vpc.id
  availability_zone = var.availability_zone[0]

  tags = merge(
    {
      "Name" = format(
        "${var.environment_name}-${var.public_subnet_interfix}-a-${count.index+1}",
      )
    },
    var.additional_tags
  )
}