

resource "aws_autoscaling_group" "auto_scaling_group_port80" {
  name             = "${local.name}-auto-scaling-group-port80"
  min_size         = 1
  max_size         = 5
  desired_capacity = 2
  # availability_zones = data.aws_availability_zones.available.names
  target_group_arns  = [aws_lb_target_group.alb_target_group1.arn]
  vpc_zone_identifier       = ["${module.vpc.public_subnets[0]}"]
  launch_template {
    id = aws_launch_template.web1_temp.id
  }
  depends_on = [
    module.vpc
  ]
}

resource "aws_autoscaling_group" "auto_scaling_group_port8080" {
  name             = "${local.name}-auto-scaling-group-port8080"
  min_size         = 1
  max_size         = 5
  desired_capacity = 2
  # availability_zones = data.aws_availability_zones.available.names
  target_group_arns  = [aws_lb_target_group.alb_target_group2.arn]
  vpc_zone_identifier       = ["${module.vpc.public_subnets[1]}"]
  launch_template {
    id = aws_launch_template.web2_temp.id
  }
  depends_on = [
    module.vpc
  ]
}