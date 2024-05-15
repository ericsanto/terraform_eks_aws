#CRIANDO ROLE
resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.project_name}_eks_cluster_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_eks_cluster_role"
    }
  )
}

#LIGANDO POLICY A ROLE CRIADA ACIMA
#ENCONTRE O ARN DA POLICY BUSCANDO POR: "arn policy amazoneksclusterpolicy"
resource "aws_iam_role_policy_attachment" "eks_cluster_role_attachment" {
  #ROLE CRIADA ACIMA
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

#O BLOCO DE CÓDIGO ACIMA É NECESSÁRIO PARA A CRIAÇÃO DO CLUSTER. SENDO ASSIM, DEVE-SE CRIAR PRIMEIRO
#A ROLE E LIGAR A POLICY "AMAZONEKSCLUSTERPOLICY" PARA DEPOIS CRIAR O CLUSTER