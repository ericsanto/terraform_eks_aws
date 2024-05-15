#CRIANDO ROLE PARA AGRUPAR AS POLICES DO NODE GROUP
resource "aws_iam_role" "eks_managed_node_group_role" {
  name = "${var.project_name}_managed_node_group"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-managed-node-group"
    }
  )
}

resource "aws_iam_role_policy_attachment" "eks_cluster_managed_node_group_role_attachment_worker_node" {
  #ROLE CRIADA ACIMA
  role       = aws_iam_role.eks_managed_node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_cluster_managed_node_group_role_attachment_container_register" {
  #ROLE CRIADA ACIMA
  role       = aws_iam_role.eks_managed_node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "eks_cluster_managed_node_group_role_attachment_cni" {
  #ROLE CRIADA ACIMA
  role       = aws_iam_role.eks_managed_node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
