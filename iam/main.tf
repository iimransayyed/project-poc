#Create a policy
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy
resource "aws_iam_policy" "ec2_policy" {
  name        = local.iam_policy_name
  path        = "/"
  description = "Policy to provide permission to EC2"
  policy = data.aws_iam_policy_document.example.json
  tags = var.tags
}

#Create a role
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
resource "aws_iam_role" "ec2_role" {
  name = local.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
  tags = var.tags
}

#Attach role to policy
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment
resource "aws_iam_policy_attachment" "ec2_policy_role" {
  name       = "ec2_attachment"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.ec2_policy.arn
}

#Attach role to an instance profile
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}