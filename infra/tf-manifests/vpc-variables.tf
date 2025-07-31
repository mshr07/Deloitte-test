variable "name" {
    type = string
    description = "Name of the VPC"
    default = "mock-sail-dev-vpc"
}

variable "vpc_cidr_block" {
    type = string
    description = "VPC CIDR Block"
    default = "10.0.0.0/16"
}

variable "vpc_availability_zones" {
    type = list(string)
    description = "VPC Availability Zones"
    default = ["us-east-1a", "us-east-1b"]  
}

variable "vpc_private_subnets" {
    type = list(string)
    description = "VPC Private Subnets"
    default = ["10.0.1.0/24", "10.0.2.0/24"]  
}

variable "vpc_public_subnets" {
    type = list(string)
    description = "VPC Public Subnets"
    default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "create_database_subnet_group" {
    type = bool
    description = "Create Database Subnet Group"
    default = true
}

variable "database_subnet_route_table" {
    type = bool
    description = "Create Database Subnet Route Table"
    default = true
}

variable "database_subnets" {
    type = list(string)
    description = "VPC Database Subnets"
    default = ["10.0.21.0/24", "10.0.22.0/24"]
}   
