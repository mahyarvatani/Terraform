
resource "aws_lb" "alb1" {
  name            = "${local.name}-alb1"
  subnets         = module.vpc.public_subnets
  security_groups = [module.alb_sg.security_group_id]
  internal        = false
  idle_timeout    = 60
}

resource "aws_lb" "alb2" {
  name            = "${local.name}-alb2"
  subnets         = module.vpc.public_subnets
  security_groups = [module.alb_sg.security_group_id]
  internal        = false
  idle_timeout    = 60
}


resource "aws_lb_target_group" "alb_target_group1" {
  name     = "${local.name}-target-group1"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = 80
  }
}


resource "aws_lb_target_group" "alb_target_group2" {
  name     = "${local.name}-target-group2"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = 8080
  }
}


resource "aws_lb_listener" "alb_listener_80" {
  load_balancer_arn = aws_lb.alb1.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.alb_target_group1.arn
    type             = "forward"
  }
}

resource "aws_lb_listener" "alb_listener_8080" {
  load_balancer_arn = aws_lb.alb2.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.alb_target_group2.arn
    type             = "forward"
  }
}