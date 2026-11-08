resource "aws_globalaccelerator_accelerator" "frontend_ga" {
  name            = "certia-frontend-ga"
  ip_address_type = "IPV4"
  enabled         = true

  tags = {
    Name       = "Certia-Frontend-GA"
    Project    = "Route53vsAWSGlobalAccelerator"
    Gestionado = "Terraform"
  }
}

resource "aws_globalaccelerator_listener" "frontend_ga_listener" {
  accelerator_arn = aws_globalaccelerator_accelerator.frontend_ga.id
  client_affinity = "NONE"
  protocol        = "TCP"

  port_range {
    from_port = 80
    to_port   = 80
  }
}

resource "aws_globalaccelerator_endpoint_group" "frontend_ga_eg" {
  listener_arn          = aws_globalaccelerator_listener.frontend_ga_listener.id
  endpoint_group_region = var.aws_region

  endpoint_configuration {
    endpoint_id                    = aws_lb.certia_alb.arn
    client_ip_preservation_enabled = true
    weight                         = 128
  }
}
