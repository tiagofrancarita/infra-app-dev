# infra-repo/variables.tf

variable "aws_region" {
  description = "Região da AWS para provisionar os recursos."
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Bloco CIDR para a VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidrs" {
  description = "Lista de blocos CIDR para subnets públicas."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidrs" {
  description = "Lista de blocos CIDR para subnets privadas."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Zonas de disponibilidade para as subnets."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "ec2_ami" {
  description = "ID da AMI para a instância EC2."
  default     = "ami-0c94855ba95c71c99" # Amazon Linux 2
}

variable "ec2_instance_type" {
  description = "Tipo da instância EC2."
  default     = "t2.micro"
}

variable "app_repo_url" {
  description = "URL do repositório da aplicação para clonar."
  type        = string
}

variable "app_service_name" {
  description = "Nome do serviço da aplicação."
  type        = string
  default     = "app.service"
}
