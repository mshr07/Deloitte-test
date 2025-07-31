module "ec2-public" {
    source  = "terraform-aws-modules/ec2-instance/aws"
    version = "5.5.0"

    name = "${local.name}-public-bastion"
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.instance_type
    key_name = var.instance_keypair
    subnet_id = module.vpc.public_subnets[0]
    vpc_security_group_ids = [module.public-bastion-sg.security_group_id]
    # user_data = file("./files/bastion.sh")
    tags = local.common_tags
}