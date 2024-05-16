module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source       = "./modules/cluster"
  project_name = var.project_name
  tags         = local.tags
  #VALORES DAS VARIAVEIS CRIADAS NO ARQUIVO modules/cluster/variables.tf
  eks_subnet_public-1a = module.eks_network.eks_subnet_public-1a
  eks_subnet_public-1b = module.eks_network.eks_subnet_public-1b
}

module "eks_node_group" {
  source                = "./modules/managed-node-group"
  project_name          = var.project_name
  tags                  = local.tags
  eks_subnet_private-1a = module.eks_network.eks_subnet_private-1a
  eks_subnet_private-1b = module.eks_network.eks_subnet_private-1b
  cluster_name          = module.eks_cluster.cluster_name
}

module "eks_aws_load_balancer_controller" {
  source       = "./modules/aws-load-balancer-controller"
  project_name = var.project_name
  tags         = local.tags
  oidc         = module.eks_cluster.oidc
}