variable "project_name" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "eks_subnet_private-1a" {
  type = string
}

variable "eks_subnet_private-1b" {
  type = string
}

variable "cluster_name" {
  type = string
}