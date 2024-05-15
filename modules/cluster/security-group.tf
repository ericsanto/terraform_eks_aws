#Com essa regra de grupo de segurança, qualquer tráfego TCP na porta 443 (HTTPS)
#de qualquer endereço IP será permitido no grupo de segurança associado ao seu cluster do Amazon EKS. 
resource "aws_security_group_rule" "eks_cluster_security_group" {
  type      = "ingress"
  from_port = 443
  to_port   = 443
  protocol  = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  #Grupo de segurança ao qual aplicar esta regra
  security_group_id = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}