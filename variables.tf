#ARQUIVO ONDE DECLARAMOS VARIAVEIS

variable "cidr_block" {
  type        = string
  description = "CIDR de rede para a vpc"
}

variable "project_name" {
  type = string
}
