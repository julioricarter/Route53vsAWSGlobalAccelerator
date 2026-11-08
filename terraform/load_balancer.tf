resource "aws_lb" "certia_alb" {
  name               = "certia-frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = data.aws_subnets.default.ids

  tags = {
    Name      = "Certia-Frontend-ALB"
    Project   = "Route53vsAWSGlobalAccelerator"
    Gestonado = "Terraform"
  }
}

resource "aws_lb_target_group" "certia_tg" {
  name     = "certia-evidencia-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
}

resource "aws_lb_target_group_attachment" "web_attach" {
  count            = 2
  target_group_arn = aws_lb_target_group.certia_tg.arn
  target_id        = aws_instance.web[count.index].id
  port             = 80
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.certia_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.certia_tg.arn
  }
}
