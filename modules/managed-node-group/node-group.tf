resource "aws_eks_node_group" "node_group_eks_cluster" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-node-group"
  #ROLE CRIADA NO ARQUIVO ./modules/managed-node-group/iam.tf
  node_role_arn = aws_iam_role.eks_managed_node_group_role.arn
  subnet_ids = [
    var.eks_subnet_private-1a,
    var.eks_subnet_private-1b
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # ATTACHMENTS QUE FOI CRIADA NO ARQUIVO modules/managed-node-group/iam.tf
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_managed_node_group_role_attachment_worker_node,
    aws_iam_role_policy_attachment.eks_cluster_managed_node_group_role_attachment_container_register,
    aws_iam_role_policy_attachment.eks_cluster_managed_node_group_role_attachment_cni,
  ]

  tags = var.tags
}