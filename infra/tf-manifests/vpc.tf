# data "aws_availability_zones" "available" {
#     state = "available"
# }
  
module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "5.17.0"

    name = var.name
    cidr = var.vpc_cidr_block

# VPC Basic Details
    azs                   = var.vpc_availability_zones
    # azs                 = data.aws_availability_zones.available.names
    private_subnets     = var.vpc_private_subnets
    public_subnets      = var.vpc_public_subnets
    map_public_ip_on_launch = true

# VPC Database Subnets
    create_database_subnet_group              = var.create_database_subnet_group
    create_database_subnet_route_table        = var.database_subnet_route_table
    database_subnets                          = var.database_subnets

# Enable Private Subnets to NAT GTW for Outbound communication
    enable_nat_gateway = true
    single_nat_gateway = true   // can enable one in each public subnet but for cost reasons, simply creating one across both AZs

# Enable DNS hostnames
    enable_dns_hostnames    = true
    enable_dns_support      = true

#Enable Tagging
    # public_subnet_tags = {
    #     Type = "mock-sail-dev-public-sbn"
    # }

    # private_subnet_tags = {
    #     Type = "mock-sail-dev-private-sbn"
    # }

    # database_subnet_tags = {
    #     Type = "mock-sail-dev-db-sbn"
    # }

    tags = {
        Owner = "gjr"
        Env = "dev"
        Project = "mock-sail"
    }

    vpc_tags = {
        Name = "mock-sail-dev-vpc"
    }

    # Additional Tags to subnets
    public_subnet_tags = {
        Type = "Public-Subnets"
        "kubernetes.io/role/internal-elb" = 1
        "kubernetes.io/cluster/${local.name}-${var.cluster_name}" = "shared"
    }

    private_subnet_tags = {
        Type = "Private-Subnets"
        "kubernetes.io/role/internal-elb" = 1
        "kubernetes.io/cluster/${local.name}-${var.cluster_name}" = "shared"
    }

    database_subnet_tags = {
        Type = "Database-Subnets"
    }
}