output "route53_domain" {
  description = "Registro creado en Route 53"
  value       = aws_route53_record.frontend.name
}

output "route53_nameserver" {
  description = "Servidor DNS autoritativo de Route 53 para consultar"
  value       = aws_route53_zone.evidencia.name_servers[0]
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
  description = "DNS del balanceador"
  value       = aws_lb.certia_alb.dns_name
}