output "aws_id_account" {
  value = data.aws_caller_identity.current.id
}

output "role_load_balancer_controller" {
  value = aws_iam_role.role_load_balancer_controller
}