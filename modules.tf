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

