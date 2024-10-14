resource "aws_launch_template" "web1_temp" {
  name = "temp1"

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 20
    }
  }

  disable_api_stop        = true
  disable_api_termination = true


  image_id = "${data.aws_ami.amznlinux2.id}"

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = "t2.micro"


  key_name = var.ec2_web_keypair


  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [module.web2_sg.security_group_id]
    subnet_id                   = module.vpc.public_subnets[0]
    delete_on_termination       = true
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${local.name}-instance-type1"
    }
  }

  user_data = filebase64("${path.module}/userdata.80")
}





resource "aws_launch_template" "web2_temp" {
  name = "temp2"

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 20
    }
  }

  disable_api_stop        = true
  disable_api_termination = true


  image_id = "${data.aws_ami.amznlinux2.id}"

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = "t2.micro"


  key_name = var.ec2_web_keypair


  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [module.web2_sg.security_group_id]
    subnet_id                   = module.vpc.public_subnets[0]
    delete_on_termination       = true
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${local.name}-instance-type2"
    }
  }

  user_data = filebase64("${path.module}/userdata.8080")
}

