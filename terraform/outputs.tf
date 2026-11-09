output "route53_domain" {
  description = "El dominio configurado en Route 53"
  value       = aws_lb.certia_alb.dns_name
}

output "global_accelerator_ip_1" {
  description = "Primera IP estática Anycast"
  value       = aws_globalaccelerator_accelerator.frontend_ga.ip_sets[0].ip_addresses[0]
}

output "global_accelerator_ip_2" {
  description = "Segunda IP estática Anycast"
  value       = aws_globalaccelerator_accelerator.frontend_ga.ip_sets[0].ip_addresses[1]
}

output "alb_dns" {
  description = "DNS interno del balanceador (uso de debug)"
  value       = aws_lb.certia_alb.dns_name
}
