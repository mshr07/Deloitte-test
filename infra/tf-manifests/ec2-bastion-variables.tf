# AWS EC2 Bastion host variables

# AWS EC2 Instance Type
variable "instance_type" {
    type        = string
    default     = "t3.micro"
    description = "EC2 Instance Type"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
    type        = string
    default     = "mock-sail-key"
    description = "EC2 Instance Key Pair"
}