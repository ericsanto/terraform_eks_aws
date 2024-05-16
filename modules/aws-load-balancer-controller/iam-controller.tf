resource "aws_iam_policy" "policy_controller" {
  name   = "${var.project_name}-load-balancer-controller"
  policy = file("${path.module}/policy.json")
  tags   = var.tags
}

resource "aws_iam_role" "role_load_balancer_controller" {
  name = "${var.project_name}-role-load-balancer-controller"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${var.oidc}"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringEquals" : {
            "oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${local.oidc}:aud" : "sts.amazonaws.com",
            "oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${local.oidc}:sub" : "system:serviceaccount:kube-system:aws-load-balancer-controller"
          }
        }
      }
    ]
  })
}


#ATTACHMENT DA POLICY 'policy_controller' E DA ROLE 'role_load_balancer_controller' ENCONTRADAS NO MESMO ARQUIVO
resource "aws_iam_role_policy_attachment" "eks_controller_role_attachment" {
  role       = aws_iam_role.role_load_balancer_controller.name
  policy_arn = aws_iam_policy.policy_controller.arn
}