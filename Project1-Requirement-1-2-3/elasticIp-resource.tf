resource "aws_eip" "bastionhost_elasticip" {

  depends_on = [module.ec2_bastionhost, module.vpc]

  instance = "${module.ec2_bastionhost.id}"
  domain = "vpc"

}

resource "aws_eip" "web1_elasticip" {

  depends_on = [module.ec2_web1, module.vpc]

  instance = "${module.ec2_web1.id}"
  domain = "vpc"

}

resource "aws_eip" "web2_elasticip" {

  depends_on = [module.ec2_web2, module.vpc]

  instance = "${module.ec2_web2.id}"
  domain = "vpc"

}