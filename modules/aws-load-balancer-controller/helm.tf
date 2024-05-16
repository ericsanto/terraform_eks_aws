#O objetivo desse código é instalar e configurar o AWS Load Balancer Controller em um cluster EKS. 
#O AWS Load Balancer Controller gerencia Elastic Load Balancers para aplicações Kubernetes que utilizam serviços 
#Kubernetes de tipo LoadBalancer. Ele suporta a criação de Classic Load Balancers (CLB), 
#Application Load Balancers (ALB) e Network Load Balancers (NLB).

resource "helm_release" "eks_helm_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "service.Account.name"
    value = "aws-load-balancer-controle"
  }
}