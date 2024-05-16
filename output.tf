# ESTOU BUSCANDO O OUTPUT DO ARQUIVO MODULES/CLUSTER/OUTPUT.TF
# O NOME DO OUTPUT É: eks_cluster_vpc_config
output "vpc_config" {
  value = module.eks_cluster.eks_cluster_vpc_config
}

output "eks_cluster_role_attachment" {
  value = module.eks_cluster.eks_cluster_role_attachment
}

output "oidc" {
  value = module.eks_cluster.oidc
}

output "role_load_balancer_controller" {
  value = module.eks_aws_load_balancer_controller.role_load_balancer_controller
}

output "cluster_endpoint" {
  value = module.eks_cluster.cluster_endpoint
}