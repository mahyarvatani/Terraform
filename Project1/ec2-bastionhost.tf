module "ec2_bastionhost" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.0"

  name = "ec2-bastionhost"

  ami                    = data.aws_ami.amznlinux2.id
  instance_type          = var.ec2_bastionhost_type[var.environment]
  key_name               = var.ec2_bastionhost_keypair
  monitoring             = var.ec2_bastionhost_monitoring
  vpc_security_group_ids = [module.bastionhost_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

}

