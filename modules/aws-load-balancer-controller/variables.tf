variable "project_name" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "oidc" {
  type = string
}

variable "cluster_name" {
  type = string
}