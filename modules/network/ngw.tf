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

resource "aws_route_table" "eks-private-subnet-route-table-1a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_public_subnet-ngw-1a.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-private-route-table-1a"
    }
  )
}

resource "aws_route_table" "eks-private-subnet-route-table-1b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_public_subnet-ngw-1b.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-private-route-table-1b"
    }
  )
}

