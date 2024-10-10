output "eks_cluster_arn" {
  value = aws_eks_cluster.eks_cluster.arn
}

output "eks_cluster_id" {
  value = aws_eks_cluster.eks_cluster.id
}

output "eks_cluster_certificate_authority_data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_cluster_security_group_id" {
  value = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}

output "eks_cluster_iam_role_name" {
  value = aws_iam_role.eks_master_role.name
}

output "eks_cluster_iam_role_arn" {
  value = aws_iam_role.eks_master_role.arn
}

output "eks_cluster_oidc_issuer" {
  value = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "eks_cluster_cluster_security_group" {
  value = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}

# Public node groups

output "eks_public_node_group_id" {
  value = aws_eks_node_group.eks_cluster_node_group_public.id
}

output "eks_public_node_group_arn" {
  value = aws_eks_node_group.eks_cluster_node_group_public.arn
}

output "eks_public_node_group_status" {
  value = aws_eks_node_group.eks_cluster_node_group_public.status
}

output "eks_public_node_group_version" {
  value = aws_eks_node_group.eks_cluster_node_group_public.version
}

