resource "aws_launch_template" "web1_temp" {
  name = "ec2-web1-temp-port80"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 20
    }
  }

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination = true

  ebs_optimized = true

  image_id = data.aws_ami.amznlinux2.id

  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = "t2.micro"
  key_name                             = var.ec2_web_keypair
  monitoring {
    enabled = true
  }
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = ["${module.web1_sg.security_group_id}"]
    subnet_id                   = module.vpc.public_subnets[0]
    delete_on_termination       = true
  }
  placement {
    availability_zone = data.aws_availability_zones.available.names[0]
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${local.name}-temp1"
    }
  }

  user_data = filebase64("${path.module}/userdata.80")
}


resource "aws_launch_template" "web2_temp" {
  name = "ec2-web1-temp-port8080"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 20
    }
  }

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination = true

  ebs_optimized = true

  image_id = data.aws_ami.amznlinux2.id

  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = "t2.micro"
  key_name                             = var.ec2_web_keypair
  monitoring {
    enabled = true
  }
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = ["${module.web2_sg.security_group_id}"]
    subnet_id                   = module.vpc.public_subnets[1]
    delete_on_termination       = true
  }
  placement {
    availability_zone = data.aws_availability_zones.available.names[1]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${local.name}-temp2"
    }
  }

  user_data = filebase64("${path.module}/userdata.8080")
}


resource "aws_autoscaling_group" "auto_scaling_group_port80" {
  name             = "${local.name}-auto-scaling-group-port80"
  min_size         = 1
  max_size         = 5
  desired_capacity = 1
  #   vpc_zone_identifier  = module.vpc.public_subnets
  availability_zones = [data.aws_availability_zones.available.names[0]]
  target_group_arns  = [aws_lb_target_group.alb_target_group1.arn]
  launch_template {
    id = aws_launch_template.web1_temp.id
  }
  depends_on = [
    module.vpc,
    aws_lb.alb,
    aws_launch_template.web1_temp
  ]
}

resource "aws_autoscaling_group" "auto_scaling_group_port8080" {
  name             = "${local.name}-auto-scaling-group-port8080"
  min_size         = 1
  max_size         = 5
  desired_capacity = 1
  #   vpc_zone_identifier  = module.vpc.public_subnets
  availability_zones = [data.aws_availability_zones.available.names[1]]
  target_group_arns  = [aws_lb_target_group.alb_target_group2.arn]
  launch_template {
    id = aws_launch_template.web2_temp.id
  }
  depends_on = [
    module.vpc,
    aws_lb.alb,
    aws_launch_template.web2_temp
  ]
}