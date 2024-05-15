output "eks_cluster_role_attachment" {
  value = aws_iam_role_policy_attachment.eks_cluster_role_attachment.id
}

# RETORNA UM OBJETO DE VPC_CONFIG
output "eks_cluster_vpc_config" {
  value = aws_eks_cluster.eks_cluster.vpc_config
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}