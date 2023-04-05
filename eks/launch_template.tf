#### User data for worker launch
resource "aws_launch_template" "lt-ng" {
  instance_type           = "t3.small"
  key_name                = "eks-workernode"
  name                    = format(local.worker_node_name)
  update_default_version  = true
  tag_specifications { 
        resource_type = "instance"
    tags = {
        Name = format(local.worker_node_name)
        }
    }
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 50
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