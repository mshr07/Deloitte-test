# AWS EC2 Security Group for Bastion Host

module "public-bastion-sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "5.1.0"

    name        = "${local.name}-public-bastion-sg"
    description = "Allow incoming SSH traffic"
    vpc_id      = module.vpc.vpc_id

    # Ingress Rule
    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules       = ["ssh-tcp"]

    # Egress Rule
    egress_rules = ["all-all"]

    # Tags
    tags = local.common_tags
}