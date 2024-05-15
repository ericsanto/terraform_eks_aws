#ROUTE-TABLES PARA SUBNETS PÚBLICAS
resource "aws_route_table" "eks-public-subnet-route-table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-public-route-table"
    }
  )
}

#ROUTE-TABLE PARA SUBNETS PRIVADAS
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