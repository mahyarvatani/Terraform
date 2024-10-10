resource "aws_eks_node_group" "eks_cluster_node_group_private" {
  cluster_name    = local.cluster_name
  node_group_name = "${local.name}-private_node_group"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = module.vpc.private_subnets
  version         = var.cluster_version
  ami_type        = "AL2_x86_64"
  capacity_type   = "ON_DEMAND"
  disk_size       = 20

  scaling_config {
    desired_size = 2
    max_size     = 6
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly,
  ]
}