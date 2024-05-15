#CRIA UM ELASTIC IP
resource "aws_eip" "eks_ngw_eip_1a" {
  vpc = true
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1a"
    }
  )
}

resource "aws_eip" "eks_ngw_eip_1b" {
  vpc = true
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1b"
    }
  )
}

#ALOCA O ELASTIC IP EM UMA SUBNET
resource "aws_nat_gateway" "eks_public_subnet-ngw-1a" {
  allocation_id = aws_eip.eks_ngw_eip_1a.id
  subnet_id     = aws_subnet.eks_subnet_public-1a.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )
}

#CRIA UM NATGATWAY
resource "aws_nat_gateway" "eks_public_subnet-ngw-1b" {
  allocation_id = aws_eip.eks_ngw_eip_1b.id
  subnet_id     = aws_subnet.eks_subnet_public-1b.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-1b"
    }
  )
}


