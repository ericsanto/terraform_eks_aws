resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}_cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
     var.eks_subnet_public-1a,
     var.eks_subnet_public-1b
    ]
  }

  depends_on = [ 
    aws_iam_role_policy_attachment.eks_cluster_role_attachment
   ]

}
