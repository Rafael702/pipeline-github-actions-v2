variable "aws_key_pub" {
  description = "Chave publica para maquina na aws"
  type        = string
}

variable "azure_key_pub" {
  description = "Chave publica para maquina na azure"
  type        = string
}

variable "location" {
  description = "Regiao onde os recursos serao criados na Azure"
  type        = string
  default     = "Brazil South"
}