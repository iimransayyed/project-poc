#### User data for worker launch
resource "aws_launch_template" "lt-ng1" {
  instance_type           = "t3.small"
  key_name                = "eks-workernode"
  name                    = format("%s-ng1", local.worker_node_name)
  tag_specifications { 
        resource_type = "instance"
    tags = {
        Name = format(local.worker_node_name)
        }
    }
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 100
      volume_type = "gp2"
    }
  }
  tag_specifications {
    resource_type = "volume"

    tags = {
      Name = format(local.worker_node_name)
    }
  }      
  lifecycle {
    create_before_destroy=true
  }
}