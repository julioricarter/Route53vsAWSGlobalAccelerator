variable "aws_region" {
  description = "Región principal de despliegue"
  type        = string
  default     = "us-east-1"
}

variable "zone_name" {
  description = "Nombre de la hosted zone de prueba en Route 53"
  type        = string
  default     = "certia-evidencia.com"
}