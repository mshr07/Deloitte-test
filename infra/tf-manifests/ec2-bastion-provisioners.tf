# Create a null resource provisioner
resource "null_resource" "copy_ec2_keys" {
    depends_on  = [ module.ec2-public ] 

    # define the Connection Block for provisioners to connect to EC2 Instance
    connection {
        type = "ssh"
        host = aws_eip.bastion_eip.public_ip
        user = "ec2-user"
        password = ""
        private_key = file("private-key/mock-sail-key.pem")
    }

    # File provisioner copies the mock-sail-key.pem file to the bastion host /tmp/mock-sail-key.pem location
    provisioner "file" {    
        source = "private-key/mock-sail-key.pem"
        destination = "/tmp/mock-sail-key.pem"
    }

    # Remote Exec Provisioner will execute the command "sudo chmod 400 /tmp/mock-sail-key.pem" on the bastion host
    provisioner "remote-exec" {
        inline = [
            "sudo chmod 400 /tmp/mock-sail-key.pem"
        ]
    }

    # Local Exec Provisioner will execute the command "echo 'mock-sail-key' | sudo tee -a /etc/ssh/ssh_known_hosts" on the local machine
    provisioner "local-exec" {
        # command = "echo '${aws_eip.bastion_eip.public_ip} mock-sail-key' | sudo tee -a ~/.ssh/known_hosts"
        command = "echo VPC created on `date` and VPC Id: ${module.vpc.vpc_id}  >> creation-time-vpc-id.txt"
        working_dir = "local-exec-output-files"
    }
}