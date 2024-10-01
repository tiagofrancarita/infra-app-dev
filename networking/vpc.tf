# infra-repo/networking/vpc.tf

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "dev-igw"
  }
}
