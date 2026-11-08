resource "aws_instance" "web" {
  count                  = 2
  ami                    = "ami-0c7217cdde317cfec" # Ubuntu 22.04 us-east-1
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnets.default.ids[count.index]
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              echo "<h1>Hola, aqui probando desde Certia - Nodo ${count.index + 1}</h1>" > /var/www/html/index.html
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "Certia-Evidencia-Nodo-${count.index + 1}"
  }
}
