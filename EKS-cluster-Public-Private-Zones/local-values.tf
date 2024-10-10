locals {
  name         = "${var.customer}-${var.environment}"
  cluster_name = "${local.name}-eks-cluster"
}