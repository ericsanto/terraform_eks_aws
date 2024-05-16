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

output "oidc" {
  value = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_certificate_authority" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}