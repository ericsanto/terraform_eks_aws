resource "kubernetes_service_account" "example" {
  metadata {
    name = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
        "eks.amazonaws.com/role-arn" = aws_iam_role.role_load_balancer_controller.arn
    }
  }
}