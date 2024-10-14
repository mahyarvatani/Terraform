# module "ec2_app2" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "5.7.0"

#   name = "ec2-app2"

#   ami                    = data.aws_ami.amznlinux2.id
#   instance_type          = var.ec2_app_type[var.environment]
#   key_name               = var.ec2_app_keypair
#   monitoring             = var.ec2_app_monitoring
#   vpc_security_group_ids = [module.app_sg.security_group_id]
#   subnet_id              = module.vpc.private_subnets[1]
#   user_data              = file("${path.module}/userdata.8080")
#   iam_instance_profile   = aws_iam_instance_profile.ec2_fullaccess_profile.name
# }

