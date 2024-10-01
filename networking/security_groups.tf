# infra-repo/networking/security_groups.tf

resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  description = "Security group para a aplicação Spring Boot"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Permitir tráfego HTTP na porta 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite acesso de qualquer IP
  }

  ingress {
    description = "Permitir tráfego SSH na porta 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Para facilitar, mas em produção restringir
  }

  egress {
    description = "Permitir todo o tráfego de saída"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Todos os protocolos
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-security-group"
  }
}
