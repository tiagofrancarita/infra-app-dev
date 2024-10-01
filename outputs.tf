# infra-repo/outputs.tf

output "vpc_id" {
  description = "ID da VPC principal"
  value       = module.networking.vpc_id
}

output "public_subnets" {
  description = "IDs das subnets públicas"
  value       = module.networking.public_subnets
}

output "private_subnets" {
  description = "IDs das subnets privadas"
  value       = module.networking.private_subnets
}

output "ec2_public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = module.compute.ec2_public_ip
}

output "ec2_instance_id" {
  description = "ID da instância EC2"
  value       = module.compute.ec2_instance_id
}
