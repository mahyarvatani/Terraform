module "ec2_web1" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.0"

  name = "ec2-web1"

  ami = data.aws_ami.amznlinux2.id
  instance_type          = var.ec2_web_type[var.environment]
  key_name               = var.ec2_web_keypair
  monitoring             = var.ec2_web_monitoring
  vpc_security_group_ids = [module.web1_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  user_data = file("${path.module}/userdata.80")

}

