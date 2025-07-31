#VPC Outputs
output "vpc_id" {
    value = module.vpc.vpc_id
    description = "The ID of the VPC"
}

output "vpc_cidr_block" {
    value = module.vpc.vpc_cidr_block
    description = "The CIDR block of the VPC"   
}

output "vpc_public_subnets" {
    value = module.vpc.public_subnets
    description = "List of IDs of public subnets"
}

output "vpc_private_subnets" {  
    value = module.vpc.private_subnets
    description = "List of IDs of private subnets"
}   

output "vpc_database_subnets" {
    value = module.vpc.database_subnets
    description = "List of IDs of database subnets"
}

output "nat_public_ips" {
    value = module.vpc.nat_public_ips
    description = "List of public Elastic IPs created for AWS NAT Gateway"
}

output "azs" {
    value = module.vpc.azs
    description = "A list of availability zones specified as argument to this module"
}