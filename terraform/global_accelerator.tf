resource "aws_globalaccelerator_accelerator" "certia_ga" {
  name            = "certia-evidencia-ga"
  ip_address_type = "IPV4"
  enabled         = true

  tags = {
    Name       = "Certia-Frontend-GA"
    Project    = "Route53vsAWSGlobalAccelerator"
    Gestionado = "Terraform"
  }
}

resource "aws_globalaccelerator_listener" "certia_ga_listener" {
  accelerator_arn = aws_globalaccelerator_accelerator.certia_ga.id
  client_affinity = "NONE"
  protocol        = "TCP"

  port_range {
    from_port = 80
    to_port   = 80
  }
}

resource "aws_globalaccelerator_endpoint_group" "certia_ga_eg" {
  listener_arn          = aws_globalaccelerator_listener.certia_ga_listener.id
  endpoint_group_region = var.aws_region

  endpoint_configuration {
    endpoint_id                    = aws_lb.certia_alb.arn
    client_ip_preservation_enabled = true
    weight                         = 128
  }
}
