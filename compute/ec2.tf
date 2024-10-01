# infra-repo/compute/ec2.tf

resource "aws_instance" "app_server" {
  ami             = var.ec2_ami
  instance_type   = var.ec2_instance_type
  subnet_id       = aws_subnet.public[0].id
  security_groups = [aws_security_group.app_sg.name]

  tags = {
    Name = "app-server"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y java-11-openjdk git

              # Instalar Docker
              sudo amazon-linux-extras install docker -y
              sudo service docker start
              sudo usermod -a -G docker ec2-user
              sudo chkconfig docker on

              # Clonar a aplicação
              git clone ${var.app_repo_url} /home/ec2-user/app
              cd /home/ec2-user/app

              # Construir e executar a aplicação
              nohup java -jar target/sua-aplicacao.jar &
              EOF

  # Opcional: atribuir um IP elástico
  associate_public_ip_address = true
}
