#FORNECE O ID DAS SUBNETS APÓS A CRIAÇÃO DELAS
output "eks_subnet_private-1a" {
  value = aws_subnet.eks_subnet_private-1a.id
}

output "eks_subnet_private-1b" {
  value = aws_subnet.eks_subnet_private-1b.id
}

output "eks_subnet_public-1a" {
  value = aws_subnet.eks_subnet_public-1a.id
}

output "eks_subnet_public-1b" {
  value = aws_subnet.eks_subnet_public-1b.id
}

output "aws_region" {
  value = data.aws_region.current.id
}