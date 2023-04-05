locals {
  cluster_role    = "${var.name_prefix}-${terraform.workspace}-eks-cluster-role"
  cluster_name    = "${var.name_prefix}-${terraform.workspace}-eks-cluster"
  workernode_role = "${var.name_prefix}-${terraform.workspace}-eks-workernode-role"
  node_group_name = "${var.name_prefix}-${terraform.workspace}-nodegroup"
  worker_node_name = "${var.name_prefix}-${terraform.workspace}-eks-managed-workernode-instance"
}

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}
data "aws_iam_policy_document" "instance_assume_role_policy1" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}