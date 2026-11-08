variable "aws_region" {
  description = "Región principal de despliegue"
  type        = string
  default     = "us-east-1"
}

variable "hosted_zone_id" {
  description = "ID de la zona alojada de Certia en Route 53"
  type        = string
  default     = "TU_HOSTED_ZONE_ID"
}

variable "domain_name" {
  description = "Subdominio para la prueba de Route 53"
  type        = string
  default     = "evidencia.tudominio.com"
}
