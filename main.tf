# infra-repo/main.tf

terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "meu-terraform-state"
    key            = "infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Chama os módulos ou recursos
module "networking" {
  source = "./networking"

  vpc_cidr              = var.vpc_cidr
  public_subnets_cidrs  = var.public_subnets_cidrs
  private_subnets_cidrs = var.private_subnets_cidrs
  availability_zones    = var.availability_zones
}

module "compute" {
  source = "./compute"

  vpc_id         = module.networking.vpc_id
  public_subnets = module.networking.public_subnets
  app_repo_url   = var.app_repo_url
  app_service_name = var.app_service_name
}

module "iam" {
  source = "./iam"

  # Defina as variáveis necessárias para IAM
}
