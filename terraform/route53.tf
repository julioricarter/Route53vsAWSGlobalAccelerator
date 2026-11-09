resource "aws_route53_zone" "evidencia" {
  name          = var.zone_name
  force_destroy = true
}

resource "aws_route53_record" "frontend" {
  zone_id = aws_route53_zone.evidencia.zone_id
  name    = "app.${var.zone_name}"
  type    = "A"

  alias {
    name                   = aws_lb.certia_alb.dns_name
    zone_id                = aws_lb.certia_alb.zone_id
    evaluate_target_health = true
  }
}