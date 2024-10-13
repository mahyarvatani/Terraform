# module "rds-aurora" {
#   source  = "terraform-aws-modules/rds-aurora/aws"
#   version = "9.9.1"

#   name                     = "${local.name}-aurora"
#   engine                   = "aurora-postgresql"
#   engine_version           = "15.4"
#   instance_class           = "db.r5g.large"
#   autoscaling_min_capacity = 2
#   autoscaling_max_capacity = 3
#   autoscaling_enabled      = true
#   vpc_id                   = module.vpc.vpc_id
#   subnets     = module.vpc.private_subnets
#   security_group_rules = {
#     ex1_ingress = {
#       source_security_group_id = module.app_sg.security_group_id
#     }
#   }
#   create_db_subnet_group=true
#   db_subnet_group_name="${local.name}-aurora"
#   database_name   = "${var.customer}${var.environment}db"
#   master_username = "root"
#   master_password = "Root"

#   storage_encrypted   = true
#   apply_immediately   = true
#   monitoring_interval = 10

#   enabled_cloudwatch_logs_exports = ["postgresql"]

# }