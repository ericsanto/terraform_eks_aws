# ESTOU BUSCANDO O OUTPUT DO ARQUIVO MODULES/CLUSTER/OUTPUT.TF
# O NOME DO OUTPUT É: eks_cluster_vpc_config
output "cluster_name" {
  value = module.eks_cluster.cluster_name
}