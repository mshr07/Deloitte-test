# Create an Elastic IP for our Bastion Host
resource "aws_eip" "bastion_eip" {
    depends_on  = [ module.ec2-public, module.vpc ]
    instance    = module.ec2-public.id
    # vpc         = true
    tags        = local.common_tags
}   