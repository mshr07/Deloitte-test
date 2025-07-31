# AWS EC2 Bastion instance outputs
output "ec2_bastion_public_instance_ids" {
    value = module.ec2-public.id
    description = "List of IDs of EC2 Instances"
}

output "ec2_baston_eip" {
    value = aws_eip.bastion_eip.public_ip
    description = "List of public Elastic IPs created for AWS EC2 Instance"
}